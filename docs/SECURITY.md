# Security

## Server Authority

All important detections are handled or verified server-side where possible.

## Tokens

Each player receives a unique session token. Tokens rotate automatically and are required by protected events.

## Heartbeat

The client sends a regular heartbeat. Missing heartbeats can result in punishment.

## Rate Limits

Events are rate-limited per player and per bucket.

## Recommended Practice

Never trust client values. Always validate money, inventory, job, vehicle and permission actions on the server.
