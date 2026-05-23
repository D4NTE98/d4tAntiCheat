# Configuration

## Heartbeat

```lua
Config.Heartbeat.enabled = true
Config.Heartbeat.interval = 15000
Config.Heartbeat.timeout = 45000
Config.Heartbeat.maxMissed = 3
```

## Tokens

```lua
Config.Token.enabled = true
Config.Token.rotateEvery = 60000
```

## Webhook

```lua
Config.Logs.webhook = 'YOUR_WEBHOOK_URL'
```

## ACE Bypass

```cfg
add_ace group.admin d4tAntiCheat.bypass allow
```

## Protected Events

Add sensitive events to:

```lua
Config.ProtectedEvents = {
    'yourResource:server:sensitiveAction'
}
```
