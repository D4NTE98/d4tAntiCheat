Config = {}

Config.Debug = false
Config.Locale = 'en'

Config.Permissions = {
    bypassAce = 'd4tAntiCheat.bypass',
    staffAce = 'd4tAntiCheat.staff'
}

Config.Heartbeat = {
    enabled = true,
    interval = 15000,
    timeout = 45000,
    maxMissed = 3
}

Config.Token = {
    enabled = true,
    rotateEvery = 60000,
    minLength = 48
}

Config.Punishments = {
    default = 'kick',
    invalidToken = 'kick',
    heartbeatMissing = 'kick',
    blacklistedWeapon = 'ban',
    blacklistedVehicle = 'kick',
    explosionAbuse = 'ban',
    eventSpam = 'kick',
    resourceStop = 'kick',
    godmode = 'kick',
    invisible = 'kick',
    speedhack = 'kick',
    spectate = 'kick'
}

Config.Logs = {
    enabled = true,
    console = true,
    webhook = ''
}

Config.RateLimits = {
    enabled = true,
    window = 1000,
    maxEvents = 18,
    protectedEventWindow = 1000,
    protectedEventMax = 8
}

Config.Detections = {
    weapons = true,
    vehicles = true,
    explosions = true,
    entities = true,
    resourceStop = true,
    godmode = true,
    invisible = true,
    speedhack = true,
    spectate = true,
    noclip = true
}

Config.ClientScan = {
    interval = 3500,
    maxSpeedOnFoot = 12.0,
    maxSpeedInVehicle = 120.0,
    maxHealth = 200,
    maxArmor = 100
}

Config.BlacklistedWeapons = {
    'WEAPON_RAILGUN',
    'WEAPON_RPG',
    'WEAPON_MINIGUN',
    'WEAPON_HOMINGLAUNCHER',
    'WEAPON_COMPACTLAUNCHER',
    'WEAPON_GRENADELAUNCHER',
    'WEAPON_RAYPISTOL',
    'WEAPON_RAYCARBINE',
    'WEAPON_RAYMINIGUN'
}

Config.BlacklistedVehicles = {
    'RHINO',
    'LAZER',
    'HYDRA',
    'OPPRESSOR',
    'OPPRESSOR2',
    'DELUXO',
    'KHANJALI',
    'AVENGER',
    'APC'
}

Config.BlacklistedExplosions = {
    [0] = true,
    [1] = true,
    [2] = true,
    [4] = true,
    [5] = true,
    [25] = true,
    [29] = true,
    [31] = true,
    [32] = true,
    [33] = true,
    [35] = true,
    [36] = true,
    [37] = true,
    [38] = true
}

Config.EntityLimits = {
    enabled = true,
    window = 3000,
    maxVehicles = 5,
    maxPeds = 8,
    maxObjects = 12
}

Config.ProtectedEvents = {
    'd4tCore:server:addMoney',
    'd4tCore:server:setJob',
    'd4tCore:server:setGang',
    'd4tCore:server:setPermission'
}
