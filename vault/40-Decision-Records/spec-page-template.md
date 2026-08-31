# Spec Page Template

Persist for **complex** feature/design work (multi-module, high-risk, or after deep clarification).  
Agent rules: `personal-dev-os/references/clarify-and-impact.md`.

Project path convention:

```text
omx_wiki/specs/<kebab-title>.md
```

If `omx_wiki` does not exist, create it or use `docs/specs/<kebab-title>.md` and note the path on the Intent Card.

---

# Spec: Title

## Status

draft | confirmed | in-progress | done

## 原文

## 标准意图

当 <条件/角色>，系统应 <可观察行为>。

## 行为增量

- ADDED:
- MODIFIED:
- REMOVED:
- 不变（显式）:

## 非目标

## 需求定义

先写产品要解决的问题，再写实现方式。每条需求使用稳定 ID，便于验收、实现和变更追踪。

| ID | 角色/触发条件 | 系统应做什么（可观察行为） | 优先级 | 验收引用 |
| --- | --- | --- | --- | --- |
| R-001 |  |  | must/should/could | A-001 |

### 关键场景

#### S-001: 场景名称

- 前置条件:
- When:
- Then:
- 异常/边界:

### 需求边界

- 用户/调用方:
- 权限与可见性:
- 输入、输出与数据保留:
- 不支持的情况:

## 验收

| ID | 验收条件（可执行/可观察） | 验证方式 | 状态 |
| --- | --- | --- | --- |
| A-001 |  | test/smoke/manual/inspection | pending |

## 非功能需求

| ID | 类别 | 指标/约束 | 目标 | 验证方式 |
| --- | --- | --- | --- | --- |
| NFR-001 | latency/reliability/security/privacy/cost |  |  |  |

## 假设

## 知识依据

## 适用规范

- 个人:
- 项目:

## 影响预览

- 模块:
- 文件/符号:
- 可能波及的功能:
- 风险:

## 设计说明

仅在需求已经足够明确后填写。需求回答“应该发生什么”，设计回答“由什么边界、数据流和机制实现”。

### 设计决策

- 所有者/模块边界:
- 主要数据流（输入 → 转换 → 持久化 → 输出）:
- 领域对象、状态与合法转换:
- API / 事件 / CLI / UI 契约:
- 失败、重试、超时与幂等:
- 权限、隐私与数据保留:
- 性能、容量与成本假设:
- 可观测性（日志、指标、追踪、告警）:

### 兼容与发布

- 迁移 / 回填:
- 向后兼容:
- Feature flag / 分阶段发布:
- 回滚或禁用:
- 发布后验证与监控窗口:

### 方案比较

- 选择:
- 关键理由:
- 被拒方案及原因:

## 实现与验证追踪

| 需求 ID | 设计/实现切片 | 代码或文档位置 | 测试/验证证据 |
| --- | --- | --- | --- |
| R-001 |  |  |  |

## 变更记录

| 日期 | 变更 | 原因 | 影响 |
| --- | --- | --- | --- |
|  |  |  |  |

## 待决问题

## 实现备注

（Plan 后补垂直切片与验证路径；实现后回填追踪表、验收状态和 Spec Status。）

## 完成检查

- [ ] 每条 must 需求都有验收条件。
- [ ] 需求与设计决策分开，且没有把技术方案伪装成产品需求。
- [ ] 主要异常、权限、兼容、回滚和可观测性已覆盖；不适用项明确标记。
- [ ] 需求 → 实现 → 验证可以追踪，或记录明确缺口。
