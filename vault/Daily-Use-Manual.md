# Daily Use Manual

口语指挥即可；不必背阶段名。Agent 应自动走 Personal Dev OS，并把知识写到正确位置。

## 完整工作流怎么用

默认循环（agent 推断阶段，你不用喊名字）：

```text
Frame → Inspect → Decide → Plan → Execute → Verify → Review → Capture → Workflow Delta
```

### 你怎么开口

| 你想做的事 | 怎么说（示例） | 正常应出现 |
| --- | --- | --- |
| 做功能 / 改产品行为 | 「做个…」「帮我实现…」 | Intent Card（标准意图、行为增量、假设、知识依据、适用规范、影响预览） |
| 复杂 / 多模块 / 高风险 | 同上，或「先澄清清楚」 | 再落 Spec 页：`omx_wiki/specs/<slug>.md`；必要时 `deep-interview` |
| 直接开干 | 「直接干」 | 最小 Intent Card 后执行 |
| 修 bug | 「修这个…」 | Inspect → 诊断标准 → 修复 + 回归验证 |
| 审查 / PR | 「review 一下」「审这个 PR」 | 对照 Intent/Spec + 规范；非琐碎走 **Open Code Review**（`ocr` / delegate） |
| 沉淀 | 「记住…」「沉淀…」 | 见下方「知识写哪里」 |

小改动：不强制整张 Intent Card。说「不要流程 / 随便聊聊」则跳过。

### 会自动用到的 Skills

| Skill | 作用 |
| --- | --- |
| `personal-dev-os` | 主工作流（各 IDE 软链同一份） |
| `open-code-review` / `open-code-review-delegate` | Review 加深；无 OCR 模型时用 delegate |
| `deep-interview` / `grill-me` | 复杂/仍模糊时升级澄清（按需） |
| codegraph（MCP） | 影响面 / 调用关系（优先于再装一套图工具） |

主 skill 路径（只改深度内容这一处）：

```text
~/.codex/skills/personal-dev-os/
```

**常驻底线（必须有）**：`90-Agent-Adapters/personal-dev-os.always-on.md`  
软链到 Cursor/Claude rules、Gemini AGENTS。只靠 skills **不够**——换工作区常会整段跳过流程。

其它 IDE 的 `skills/personal-dev-os` 都是软链。断了可跑：

```bash
"~/Agent Engineering OS/90-Agent-Adapters/ensure-adapter-links.sh"
```

改完 always-on / rules 后：**新开 Agent 会话**（Cursor 建议 Reload Window 一次）。

### 各阶段你该看到什么（非琐碎）

1. **Frame**：Intent Card；复杂则写 Spec 页  
2. **Inspect**：读代码 + wiki/CONTEXT/规范；填影响预览  
3. **Decide / Plan**：方案与垂直切片（可简可详）  
4. **Execute**：小步改代码  
5. **Verify**：测试/类型检查等证据，或明确缺口  
6. **Review**：Intent/规范 + OCR 发现；分清「违需求 / 违规范 / OCR 缺陷」  
7. **Capture / Workflow Delta**：该记的记下；流程有没有变一句带过  

---

## 知识写哪里（三层）

| 类型 | 放哪 |
| --- | --- |
| 项目事实、环境、域词、本次 Spec | 当前仓库 `omx_wiki/`、`CONTEXT.md`、ADR、`docs/` |
| 跨项目原则、清单、工作流、模板 | `~/Agent Engineering OS`（Obsidian） |
| Agent 每次自动要执行的行为 | `~/.codex/skills/personal-dev-os/`（`SKILL.md` + `references/`） |

Obsidian 不是项目知识库的别名；它是你的跨项目个人知识层。项目事实默认留在项目里，只有抽象成跨项目原则、工作流、清单或模板时才进 Obsidian。

口语路由：

| 你说 | Agent 应更新 |
| --- | --- |
| 「记住这个作为我的通用规范: …」 | Obsidian `00-Principles` 或 `20-Checklists`；若要自动执行再改 skill |
| 「把这个项目环境信息记下来: …」 | 当前 repo `omx_wiki/environments/…` 或已有 docs |
| 「把这个决策记录成 ADR: …」 | 当前 repo ADR |
| 「以后遇到 X 都按这个流程: …」 | Obsidian 工作流/ledger → 反复有效再进 skill |
| 「把这个故障复盘沉淀一下: …」 | 项目 wiki 或 Obsidian（看是否跨项目） |
| 「把这个变成以后自动遵守的规则: …」 | 先 Obsidian，再改 `personal-dev-os` |

---

## 规范怎么维护

### 分工

| 层 | 路径 | 谁看 | 何时改 |
| --- | --- | --- | --- |
| **人类规范（编辑友好）** | `Agent Engineering OS/00-Principles`、`20-Checklists`、`10-Workflows` | 你 + agent | 定原则、改清单文案 |
| **Agent 执行摘录** | `personal-dev-os/references/*.md` | agent 执行时读 | 要「每次都照做」时同步改这里 |
| **Ledger（试验场）** | `15-Workflow-Ledger/candidates.md` → `standards.md` | 流程演进 | 新习惯先 trial，再晋升 |

原则：**Obsidian 与 skill 必须同改**（标准「Vault And Skill Stay In Sync」）。软链 IDEs 到 skill，不要往每个 IDE 粘贴正文。  
先写 Obsidian → 证明有用 → skill references 已应对齐；改「以后自动」类规则时两边一起改。

### 当前规范入口

从 [[Home]] 的 Quality Gate 区域进入。新增的通用工程规范包括：

- [[20-Checklists/requirements-and-design]]：需求、设计、验收和追踪关系
- [[20-Checklists/time-and-timezone]]：UTC、IANA 时区、日期与时间戳
- [[20-Checklists/long-running-request]]：SSE、WebSocket、长轮询和异步任务
- [[20-Checklists/security-baseline]]：信任边界、权限、敏感数据和滥用控制
- [[20-Checklists/reliability-and-operations]]：SLO、超时、重试、监控和事故响应
- [[20-Checklists/release-and-deployment]]：迁移、灰度、回滚和发布后验证
- [[40-Decision-Records/incident-postmortem-template]]：事故复盘模板

这些规范不是每个任务都全部套用。先按任务风险选择适用规范，并在 Intent Card 或 Spec Page 中写明“适用规范”；不适用的高风险项要明确标记为 `N/A`。

### 常见规范文件

- 架构：`00-Principles/architecture-principles.md` ↔ skill `references/architecture.md`  
- 测试：`20-Checklists/testing-standard.md` ↔ `references/testing.md`  
- 审查：`20-Checklists/code-review-checklist.md` ↔ `references/review.md`  
- 质量门：`20-Checklists/quality-gate.md` ↔ `references/quality-gate.md`  
- 澄清/影响：[[20-Checklists/clarify-and-impact]] ↔ skill `references/clarify-and-impact.md`；模板 Intent/Spec  
- 环境变更：[[20-Checklists/environment-change]]  
- 调试：[[20-Checklists/debugging-standard]] ↔ `references/debugging.md`  
- 注释：[[20-Checklists/commenting-standard]] ↔ `references/commenting.md`  
- 领域建模：[[30-Patterns/domain-modeling-standard]] ↔ `references/domain-modeling.md`  
- 对象存储/注册表性能：[[20-Checklists/object-storage-and-registry-performance]] ↔ `references/object-storage-and-registry.md`  
- 沉淀路由：[[20-Checklists/capture]]  
- 架构框：[[20-Checklists/architecture-frame]]  

### 推荐节奏

- **任务中**：发现项目事实马上记进 `omx_wiki`；跨项目启发丢进 ledger candidate  
- **任务末**：要 verification + capture + workflow delta  
- **每周**：扫 ledger / 新笔记；重复有效的晋升 `standards.md` 并改 skill；删过时草稿  

### 示例

```text
记住这个作为我的通用规范: Review 前必须对照 Intent/Spec 的验收，不能只看 OCR 输出。
```

期望：更新 Obsidian `code-review-checklist`（或 review 相关清单）+ `personal-dev-os/references/review.md`。

```text
以后复杂功能都要先写 omx_wiki/specs 再编码，把这个变成默认规则。
```

期望：ledger/standard + `clarify-and-impact.md`（若尚未足够硬）同步。

---

## 个人规范（详细）

跨项目规则示例：

```text
记住这个作为我的通用规范: 做重构前必须先说明行为保护方式，优先用现有测试，没有测试就先补最小回归测试。
```

Agent：

1. 判断是原则 / 清单 / 工作流  
2. 改 Obsidian 对应文件  
3. 若要自动执行：改 `~/.codex/skills/personal-dev-os/`（软链已覆盖各 IDE）  

## 项目环境

```text
把这个项目环境信息记下来: 本项目后端本地启动要先跑 docker compose up postgres redis，然后进入 ai_central 执行 npm run dev。
```

写入当前 repo 的 `omx_wiki/environments/<scope>.md`（或已有 docs），**不要**写成全局个人规范。

## ADR / 故障 / 改流程本身

- ADR → 当前 repo  
- 故障复盘 → 项目 wiki 或 Obsidian  
- 「以后默认都要…」→ Obsidian → skill；工具链见 `90-Agent-Adapters/`  

Open Code Review 说明：`90-Agent-Adapters/open-code-review.md`。  
系统总览：`How-It-Works.md`。入口：`Home.md`。
