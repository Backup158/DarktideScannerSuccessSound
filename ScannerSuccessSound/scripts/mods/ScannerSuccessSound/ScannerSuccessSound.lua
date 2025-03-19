local mod = get_mod("ScannerSuccessSound")
mod.version = "1.0"

--#################################
-- Requirements
--#################################
local PlayerCharacterSoundEventAliases = require("scripts/settings/sound/player_character_sound_event_aliases")

--#################################
-- Helper Functions
--#################################
local function replaceTheSound()
    local debug = mod:get("enable_debug_mode")
    local replacementSound = mod:get("scan_sound")
    local replacementTable = {}
    -- Splits value into keys 
    --  %. escapes the magic character (period)
    --  [^%.] match anything that's not a period
    --  [^%.]+ match the longest string of not periods
    for v in string.gmatch(replacementSound, "[^%.]+") do 
        table.insert(replacementTable, v)
        if debug then mod:echo("Split string result: "..tostring(v)) end
    end

    if debug then 
        mod:echo("Replacement Sound is: "..replacementSound)
        mod:echo("Replacing sfx_scanning_sucess.events.scanner_equip with: "..PlayerCharacterSoundEventAliases[replacementTable[1]][replacementTable[2]][replacementTable[3]]) 
    end
    PlayerCharacterSoundEventAliases.sfx_scanning_sucess.events.scanner_equip = PlayerCharacterSoundEventAliases[replacementTable[1]][replacementTable[2]][replacementTable[3]]
end

--#################################
-- Hooks and Execution
--#################################
mod.on_all_mods_loaded = function()
    mod:info("ScannerSuccessSound v" .. mod.version .. " loaded uwu nya :3")
    replaceTheSound()
end
mod.on_setting_changed = function()
    replaceTheSound()
end