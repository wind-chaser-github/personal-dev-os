# Object Storage And Registry Performance

Agent operational excerpt. Human SSOT: `~/Agent Engineering OS/20-Checklists/object-storage-and-registry-performance.md`. Keep aligned when either changes.

Use when designing TOS/S3/OSS keys, media/file registries, CDN rewrites, or list/filter/search over stored blobs.

## Hard Rules

1. **Identity ≠ path.** Stable `asset_id` (DB/API). Storage key is relocatable and stored (or versioned reconstructible).
2. **No pure-flat or pure-type prefixes** as the long-term layout when volume can reach 10⁵+ keys under one prefix.
3. **Shard leaf prefixes.** Prefer time (UTC day) × coarse kind × hex shard (2 chars → 256 buckets; 4 chars only if measured).
4. **Index real filters.** Composite `(dim, created_at DESC)` for session/user/kind/source/visibility; GIN for tags/FTS.
5. **Paginate with keyset** for deep lists; avoid hot `OFFSET` + `count(*)` on wide filters.
6. **Static media hot path never hits app DB.** Embed `{MEDIA_PUBLIC_BASE_URL}/{storage_key}`; nginx/CDN path-proxies to the bucket. `GET /api/v1/media/{asset_id}` is optional admin/debug only — **forbidden** as default `<img>`/`<audio>` URL.
7. Short `/m/{id}.{ext}` CDN forms need edge lookup; do not use them as the default embed until that exists.

## Recommended Key

```text
media/{kind}/{yyyy}/{mm}/{dd}/{shard}/{asset_id}/original.{ext}
```

- `kind`: `image|audio|video|other` from mime
- `yyyy/mm/dd`: UTC create day (ops/lifecycle)
- `shard`: first 2 hex of id body
- `asset_id`: e.g. `mas_{uuid32}` — document that `mas` = media asset

Derivatives stay in the same directory (`thumb.webp`, …).

## Embed URL

```text
{MEDIA_PUBLIC_BASE_URL}/{storage_key}
# e.g. https://tagen-dev.taowhale.com/media-static/media/image/2026/08/04/ab/mas_xxx/original.png
```

## DB Minimum

- Columns: kind, session_id, owner_user_id, source, visibility, created_at, storage_key, tags/FTS as needed
- Indexes match the top query shapes; do not index every column “just in case”
- Tag/keyword search is additive, not a substitute for selective dimensions

## Before Coding

State expected volume, leaf fan-out, top 3 filters, pagination, lifecycle strategy, static embed strategy (no DB), and migration if layout changes.
