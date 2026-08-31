# Long-Running Requests And Streaming

Use for SSE, WebSocket, long polling, streaming responses, AI jobs, exports, imports, and any request that may outlive a normal HTTP timeout.

## Decision

- [ ] Prefer `create task -> return task_id -> poll or subscribe` when work can be asynchronous.
- [ ] Define the maximum request/task duration and the behavior after timeout.
- [ ] Persist task state when it must survive process restart or rolling deployment.

## Connection

- [ ] SSE/long polling has a heartbeat or keepalive interval shorter than the smallest relevant proxy/LB idle timeout.
- [ ] Clients reconnect after network loss and do not assume one connection is permanent.
- [ ] Events have stable IDs; use `Last-Event-ID` or an equivalent cursor when missed events matter.
- [ ] Check server, reverse proxy, CDN, load balancer, client, and mobile network timeout limits together.
- [ ] Define buffering, backpressure, connection limits, and graceful shutdown behavior.

## Task semantics

- [ ] Retry and duplicate submission behavior is explicit and idempotent where side effects exist.
- [ ] Cancellation is observable and has a defined cleanup policy.
- [ ] Reconnect, restart, and partial-failure paths have verification evidence.
- [ ] Metrics cover active connections, reconnects, heartbeat failures, task duration, timeout, cancellation, and queue depth.

Heartbeat alone is not a guarantee that a public-network connection will survive. Use an asynchronous task model when the work itself is long or infrastructure timeouts are uncertain.
