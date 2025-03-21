Ever put away the auspex scanner and thought to yourself, "Wait, did I actually finish that scan?" before whipping it back out to check? No longer will you have to, for this mod adds* a confirmation sound!

Choose the sound you want to use in the Mod Options menu, and you're good to go. You can choose between four ability activation sounds (Vet shout, Zealot book pulse, Psyker shriek, and Ogryn taunt). Whenever you successfully scan a target in an Investigation mission, the sound will play.

I've included an option to use the Audio plugin for custom sounds. The default custom sound is a toaster ding. See the modification section for details.

# Installation
Install like any other mod.

If you're not using the Audio plugin, this can go anywhere in the load order. There's also no requirements in this situation. Otherwise...

## Audio Plugin Integration
First of all, READ THE MOD PAGE FOR THE AUDIO PLUGIN. There are some important settings you need to check.

    ﻿DarktideLocalServer
    Audio
    ScanningSuccessSounds

If you have other Audio plugins, the position of this plugin in relation to them doesn't matter. Just make sure you're following the load order instructions on Darktide Local Server and Audio.

## Audio File Modification
When you install this mod, there's an audio folder in the mod folder. This includes some example sounds. If you want a sound to play, move it into the active folder inside the audio folder; to remove a sound, move it out of active. You can add as many custom sounds as you want (until the Audio plugin breaks under the weight). This mod will choose a random sound to play from all active sounds.

By default, I have a toaster ding sound active. There's also some inactive sounds from the guy yells at cats meme video.

# FAQ
**You never expanded on the * footnote!**

Ok fine, I'll do it here. Technically, there already is a scan completion wwise event in the game. However, it's incredibly subtle and hard to notice in actual gameplay. The added sounds are all actually replacing this one.

**Can you add more options?**

My design is not the most robust so it'll take non-trivial work to add them to this mod. This plugin came to be because I was getting sidetracked and distracting myself from other projects, so that's a bit more effort than I'd like to put in (shitposting with the mod images always gets priority though >:3).
