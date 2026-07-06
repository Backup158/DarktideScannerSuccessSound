local mod = get_mod("ScannerSuccessSound")
mod.version = "1.1.0"

--#################################
-- Requirements
--#################################
local PlayerCharacterSoundEventAliases = require("scripts/settings/sound/player_character_sound_event_aliases")

--#################################
-- Helper Functions
--#################################
local debug
local useAudio
local replacementSound
local replacementTable

local Audio
local audio_files
local SimpleAudio
local SimpleAudioRandom
local audio_volume

local function replaceTheSound()
    debug = mod:get("enable_debug_mode")
    useAudio = mod:get("use_audio")

    -- User is NOT using Audio plugin, so get option from dropdown
    -- Replace the sound then return
    -- btw, sfx_scanning_sucess is NOT a typo from my end lol
    if not useAudio then
        replacementSound = mod:get("scan_sound")
        -- Default Case. Directly replace with the sound and gtfo
        if replacementSound == "sfx_scanning_sucess.events.scanner_equip" then
            PlayerCharacterSoundEventAliases.sfx_scanning_sucess.events.scanner_equip = "wwise/events/player/play_scanner_collect_success"
            return
        end

        replacementTable = {}
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
        return
    else
        -- User is using Audio plugin
        -- Hook the sound, then play the custom sound (while silencing the original)
        Audio = get_mod("Audio")
        SimpleAudio = get_mod("SimpleAudio")
        audio_volume = mod:get("audio_volume")

        -- Setting sound back to default
        PlayerCharacterSoundEventAliases.sfx_scanning_sucess.events.scanner_equip = "wwise/events/player/play_scanner_collect_success"

        if SimpleAudio then
            SimpleAudioRandom = SimpleAudio.glob("active/*")

            SimpleAudio.hook_sound("play_scanner_collect_success", function(sound_type, event_name, delta, position_or_unit_or_id)
                if delta == nil or delta > 0.1 then
                    SimpleAudioRandom:play({
                        audio_type = "sfx",
                        volume = audio_volume,
                    })
                end

                return false
            end)
        elseif Audio then
            audio_files = Audio.new_files_handler()

            -- Audio only goes from 0-100, while SimpleAudio goes 0-200. I'm using the same widget for both, so this is a bit of precaution to avoid issues
            if audio_volume > 100 then 
                audio_volume = 100
            end

            -- Actual audio hooking
            -- "wwise/events/player/play_scanner_collect_success"
            Audio.hook_sound("play_scanner_collect_success", function(sound_type, sound_name, delta)
                if delta == nil or delta > 0.1 then
                    Audio.play_file(audio_files:random("active"), { 
                        audio_type = "sfx",
                        volume = audio_volume,
                    })
                end
            
                return false
            end)
        else
            mod:error("Simple Audio or the Audio plugin is required for this option!")
            return
        end
    end
    
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