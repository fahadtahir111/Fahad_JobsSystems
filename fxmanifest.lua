fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

author 'fahad'
description 'Fahad_JobsSystems'
version '1.0.0'

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'shared/*.lua'
}

client_scripts {
    'client/**/*.lua'
}

server_scripts {
    'server/*.lua',
	--[[server.lua]]                                                                                                    
}

escrow_ignore {
    'shared/*.lua',
}