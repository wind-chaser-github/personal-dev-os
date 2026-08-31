# Long-Running Requests And Streaming

Read for SSE, WebSocket, long polling, streaming, AI jobs, imports, exports, and requests that may exceed normal HTTP timeouts.

- Prefer `create task -> return task_id -> poll or subscribe` for asynchronous work.
- Define timeout, maximum duration, cancellation, retry, idempotency, persistence, and restart behavior.
- For SSE/long polling, use heartbeat shorter than the smallest relevant proxy/LB idle timeout.
- Clients must reconnect; use stable event IDs and `Last-Event-ID` or an equivalent cursor when missed events matter.
- Check server, proxy, CDN, load balancer, client, and mobile network limits together.
- Define buffering, backpressure, connection limits, graceful shutdown, and metrics for reconnects, heartbeat failures, duration, timeout, and queue depth.
- Heartbeat alone does not guarantee public-network survival; use an asynchronous task model when infrastructure limits are uncertain.
