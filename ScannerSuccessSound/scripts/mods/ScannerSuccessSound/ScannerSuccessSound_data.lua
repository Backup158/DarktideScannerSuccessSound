local mod = get_mod("ScannerSuccessSound")
return {
    name = mod:localize("mod_name"),
    description = mod:localize("mod_description"),
    is_togglable = true,
    options = {
		widgets = {
            {
				setting_id = "enable_debug_mode",
				type = "checkbox",
				default_value = false,
			},
			{
                setting_id = "scan_sound",
				type = "dropdown",
				default_value = "sfx_scanning_sucess.events.scanner_equip",
        		options = {
                    {text = "scan_default", value = "sfx_scanning_sucess.events.scanner_equip"},
                    {text = "scan_voc", value = "ability_shout.events.veteran_combat_ability"},
                }
			},
        }
	}
}
