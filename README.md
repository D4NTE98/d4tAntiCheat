# d4tAntiCheat

d4tAntiCheat is a server-focused anti-cheat protection layer for FiveM servers running d4tCore.

It provides token validation, heartbeat checks, event spam protection, blacklist detections, entity abuse limits, basic client integrity checks and Discord-ready logging.

## Features

- Session token system
- Automatic token rotation
- Client heartbeat validation
- Protected event validation
- Event spam rate limits
- Blacklisted weapon detection
- Blacklisted vehicle detection
- Explosion abuse protection
- Entity spawn abuse limits
- Basic godmode detection
- Basic invisible player detection
- Basic speedhack detection
- Basic spectator mode detection
- Client resource stop detection
- ACE bypass permission
- Console and webhook logs
- Local JSON ban storage

## Installation

1. Place `d4tAntiCheat` inside your resources folder.
2. Add this to `server.cfg`:

```cfg
ensure d4tCore
ensure d4tAntiCheat
```

3. Add staff bypass only for trusted groups:

```cfg
add_ace group.admin d4tAntiCheat.bypass allow
add_ace group.admin d4tAntiCheat.staff allow
```

## Configuration

Main configuration file:

```text
shared/config.lua
```

Important sections:

- `Config.Heartbeat`
- `Config.Token`
- `Config.Punishments`
- `Config.RateLimits`
- `Config.Detections`
- `Config.BlacklistedWeapons`
- `Config.BlacklistedVehicles`
- `Config.BlacklistedExplosions`
- `Config.EntityLimits`
- `Config.ProtectedEvents`

## Protected Events

Protected events should receive an anti-cheat token as their first argument.

Client example:

```lua
local token = exports.d4tAntiCheat:Token()

TriggerServerEvent('d4tCore:server:addMoney', token, 250)
```

Server-side validation is automatically attached to events listed in:

```lua
Config.ProtectedEvents
```

## Server Exports

### CheckToken

```lua
exports.d4tAntiCheat:CheckToken(source, token)
```

### Punish

```lua
exports.d4tAntiCheat:Punish(source, violation, details)
```

### IssueToken

```lua
exports.d4tAntiCheat:IssueToken(source)
```

## Client Exports

### Token

```lua
exports.d4tAntiCheat:Token()
```

Returns the current session token for the local player.

## Punishments

Available punishment modes:

- `none`
- `kick`
- `ban`

Example:

```lua
Config.Punishments.blacklistedWeapon = 'ban'
Config.Punishments.eventSpam = 'kick'
```

## Logs

Webhook logging can be enabled in:

```lua
Config.Logs.webhook = 'YOUR_WEBHOOK_URL'
```

## Ban Storage

Bans are stored locally in:

```text
bans.json
```

The file is created automatically after the first ban.

## Notes

d4tAntiCheat is a protection layer, not a complete replacement for secure resource design. Sensitive resources should still validate every important server action on their own.
