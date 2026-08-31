<!-- GENERATED FILE. Source of truth:
     ~/Agent Engineering OS/20-Checklists/object-storage-and-registry-performance.md
     SHA256: 1771b93d9b6b7c1d1c86dcc4cd6cad6d02175d5a1c80048fa4510846d90caa8b -->

# Object Storage And Registry Performance

Human checklist for object-store keys + media/file registry tables.  
Agent copy: `personal-dev-os/references/object-storage-and-registry.md`.  
Related: [[00-Principles/architecture-principles]], [[20-Checklists/architecture-frame]].

## When

Designing or changing:

- Object storage paths (TOS / S3 / OSS / local blobs)
- Media / asset / file registry tables used for list / filter / search
- CDN rewrite or stable public IDs for stored objects
- Lifecycle / GC / ops listing plans that depend on prefixes

## Forbidden Defaults

Do **not** ship any of these as the long-term layout without an explicit scale argument:

1. **Pure flat**: `media/{id}/file.ext` (one huge prefix; ops LIST and some tools choke at 10⁵–10⁶ keys)
2. **Pure type only**: `media/image/{id}/...` (type folders still become mega-directories)
3. **Date-only identity**: `images/YYYY/MM/DD/{uuid}` as the *only* identity (breaks stable URLs / reuse / migration)
4. **DB filter that always scans**: leading-wildcard `ILIKE '%x%'`, unbounded `OFFSET` deep pages, missing composite indexes for the real filter combos
5. **Static media hot path via app+DB**: embedding `GET /api/...` that looks up the registry then 302s to object storage on every `<img>`/`<audio>` load. Serving bytes is CDN/nginx/object-store work — registry is for admin, migration, and GC, not the read hot path.

## Object Key Rules

Identity and storage path are different:

| Concern | Rule |
| --- | --- |
| Public identity | Stable `asset_id` (or equivalent) in DB + API; never “the date folder” |
| Storage key | Must be **reconstructible** from registry fields (or stored verbatim) |
| Directory fan-out | Cap expected keys per leaf prefix (target ≪ 10k; design for 256–65k shards) |
| Ops / lifecycle | Prefer a **time component** in the prefix so day/month LIST and lifecycle rules are cheap |
| Type / kind | Coarse kind (`image`/`audio`/`video`/`other`) is for ops + DB filter, not the only shard axis |
| Derivatives | Same asset directory: `original.ext`, later `thumb.webp` — do not mint a new identity |

### Recommended key shape

```text
media/{kind}/{yyyy}/{mm}/{dd}/{shard}/{asset_id}/original.{ext}
```

- `kind`: coarse media kind from mime (not every tool name)
- `yyyy/mm/dd`: **UTC create day** (ops / GC / lifecycle; not the public identity)
- `shard`: first 2 hex chars of the id body → **256** buckets under each day×kind
- `asset_id`: stable id, e.g. `mas_{uuid32hex}` (`mas` = media asset; spell it out in docs)

At ~100k objects/day/kind → ~390 keys/shard/day. Scale further with 4-hex shard (`/{ab}/{cd}/`) only when measured.

### Rejected alternatives (record why)

- Flat `media/{id}/`: fails LIST/ops at volume
- Type-only `media/{kind}/{id}/`: same failure mode per type
- Hash-only without time: hard to lifecycle “session temp older than N days” by prefix
- Putting session_id into every key: high cardinality path churn; keep session in DB indexes

## Registry / Database Rules

Design filters from **real query shapes**, then index them.

Typical shapes for media registries:

1. by `asset_id` (point lookup) — UNIQUE
2. by `session_id` + time (session cleanup / debug)
3. by `owner_user_id` + time (user library of embeds)
4. by `media_kind` + time (admin browse)
5. by `source` + time (tool quality debug)
6. by `visibility` + time (promote / GC candidates)
7. by tag / keyword search (GIN / FTS; not as the only access path)

### Required columns (or equivalents)

- Stable id, mime / **media_kind**, extension, byte_size
- `bucket`, `storage_key` (full key; do not re-derive blindly after layout migrations without a version)
- `session_id`, `owner_user_id`, `source`, `visibility`
- `created_at` (timestamptz)
- Search helpers: `tags[]`, `keywords`, `search_vector` as needed

### Index expectations

- Point: UNIQUE(`asset_id`)
- List/filter: composite `(session_id, created_at DESC)`, `(media_kind, created_at DESC)`, `(owner_user_id, created_at DESC)`, `(source, created_at DESC)`, `(visibility, created_at DESC)` — keep only those matching real traffic
- Tags: GIN(`tags`)
- FTS: GIN(`search_vector`) when keyword search is in scope
- Prefer **keyset pagination** `(created_at, asset_id) < (?, ?)` over deep `OFFSET`
- Do not make `count(*)` over wide filters a hot path; return page size or approximate when UI allows

### Query anti-patterns

- Admin “search everything” with only `ILIKE '%term%'` on large tables
- Filtering on unindexed JSON blobs
- Selecting wide rows when list UI needs a projection
- Mixing hot write path with expensive tag re-extraction on every read

## CDN / Public URL (static hot path)

**Hard rule:** Deliverables must embed a **path-complete** URL under a domain we control. The browser/CDN/nginx must fetch bytes **without** hitting application DB.

| Layer | URL shape | Hits DB? |
| --- | --- | --- |
| Embed in HTML/PPT | `{MEDIA_PUBLIC_BASE_URL}/{storage_key}` | **No** |
| Media front | nginx/CDN reverse-proxy or CDN origin = bucket | **No** |
| Optional resolver | `GET /api/v1/media/{asset_id}` → 302 | Yes — admin/debug only, never default embed |
| Short CDN form `/m/{id}.{ext}` | Only with edge registry lookup or signed map | Yes at edge — optional later |

- `storage_key` already contains `asset_id` + shard/day; path-based front needs no rewrite table.
- Changing bucket/CDN: retarget nginx/CDN origin; keep `MEDIA_PUBLIC_BASE_URL` host/path prefix stable when possible.
- Do **not** leave embed URLs as vendor TOS hostnames if the product domain must survive vendor/CDN moves — put our media front in front.

## Design Checklist (before coding)

- [ ] Expected 1y object count and peak creates/day stated
- [ ] Leaf prefix fan-out estimated under that load
- [ ] Top 3 filter queries named and indexed
- [ ] Pagination strategy (keyset vs offset) chosen
- [ ] Lifecycle/GC prefix strategy stated (or explicitly “DB-driven delete by key list”)
- [ ] Identity vs storage path separation documented
- [ ] **Static embed URL is path-based (no per-request app DB)** — verified
- [ ] Migration/backfill story if key layout changes (`storage_key` stored; optional layout version)

## Sync Rule

Keep aligned with skill `references/object-storage-and-registry.md` when either changes.
