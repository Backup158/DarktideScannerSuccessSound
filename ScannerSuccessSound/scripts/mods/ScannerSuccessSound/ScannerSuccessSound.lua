local mod = get_mod("ScannerSuccessSound")
mod.version = "1.0"

--#################################
-- Requirements
--#################################
local PlayerCharacterSoundEventAliases = require("scripts/settings/sound/player_character_sound_event_aliases")

--#################################
-- Hooks
--#################################
mod.on_all_mods_loaded = function()
    mod:info("ScannerSuccessSound v" .. mod.version .. " loaded uwu nya :3")
    local debug = mod:get("enable_debug_mode")
    local replacementSound = mod:get("scan_sound")

    if debug then mod:echo("Replacement Sound is: "..replacementSound) end
    --PlayerCharacterSoundEventAliases.sfx_minigame_success.events.auspex_scanner = PlayerCharacterSoundEventAliases.ability_shout.events.veteran_combat_ability
    if debug then mod:echo("Replacing sfx_scanning_sucess.events.scanner_equip with: "..PlayerCharacterSoundEventAliases[ability_shout.events.veteran_combat_ability]) end
    PlayerCharacterSoundEventAliases.sfx_scanning_sucess.events.scanner_equip = PlayerCharacterSoundEventAliases[ability_shout.events.veteran_combat_ability]
    
    
    --"wwise/events/player/play_device_auspex_scanner_minigame_progress"


end
