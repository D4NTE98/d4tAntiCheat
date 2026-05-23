fx_version 'cerulean'
game 'gta5'

name 'd4tAntiCheat'
author 'D4NTE'
description 'Server-focused anti-cheat protection layer for d4tCore'
version '1.0.0'
lua54 'yes'

shared_scripts {
    'shared/config.lua',
    'shared/modules/*.lua'
}

client_scripts {
    'client/modules/*.lua'
}

server_scripts {
    'server/modules/*.lua'
}

dependencies {
    'd4tCore'
}
