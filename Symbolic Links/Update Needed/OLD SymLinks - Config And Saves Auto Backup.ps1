

<########## Jessica OneDrive ##########>
Set-Location "C:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\Total War Backups - Jess\Total War Settings Backup\Total War Settings Auto Backup"

<########## Total War: Pharaoh Dynasties ##########>
Set-Location "PharaohDynasties"

cmd /c rmdir /s /q "advice_history"
cmd /c rmdir /s /q "army_setups"
cmd /c rmdir /s /q "auth"
cmd /c rmdir /s /q "battle_preferences"
cmd /c rmdir /s /q "camera bookmarks"
cmd /c rmdir /s /q "custom_keys"
cmd /c rmdir /s /q "event_feed"
cmd /c rmdir /s /q "ingame_messaging"
cmd /c rmdir /s /q "maps"
cmd /c rmdir /s /q "replays"
cmd /c rmdir /s /q "resume"
cmd /c rmdir /s /q "save_games"
cmd /c rmdir /s /q "scripts"

New-Item -ItemType Junction -Path "advice_history" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\advice_history"
New-Item -ItemType Junction -Path "army_setups" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\army_setups"
New-Item -ItemType Junction -Path "auth" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\auth"
New-Item -ItemType Junction -Path "battle_preferences" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\battle_preferences"
New-Item -ItemType Junction -Path "camera bookmarks" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\camera bookmarks"
New-Item -ItemType Junction -Path "custom_keys" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\custom_keys"
New-Item -ItemType Junction -Path "event_feed" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\event_feed"
New-Item -ItemType Junction -Path "ingame_messaging" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\ingame_messaging"
New-Item -ItemType Junction -Path "maps" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\maps"
New-Item -ItemType Junction -Path "replays" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\replays"
New-Item -ItemType Junction -Path "resume" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\resume"
New-Item -ItemType Junction -Path "save_games" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\save_games"
<#scripts covers the main game settings#>
New-Item -ItemType Junction -Path "scripts" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\scripts"

<########## Total War: Three Kingdoms ##########>
Set-Location ..
Set-Location "ThreeKingdoms"

cmd /c rmdir /s /q "advice_history"
cmd /c rmdir /s /q "auth"
cmd /c rmdir /s /q "battle_preferences"
cmd /c rmdir /s /q "camera bookmarks"
cmd /c rmdir /s /q "custom_keys"
cmd /c rmdir /s /q "event_feed"
cmd /c rmdir /s /q "maps"
cmd /c rmdir /s /q "replays"
cmd /c rmdir /s /q "save_games"
cmd /c rmdir /s /q "scripts"

New-Item -ItemType Junction -Path "advice_history" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\advice_history"
New-Item -ItemType Junction -Path "auth" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\auth"
New-Item -ItemType Junction -Path "battle_preferences" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\battle_preferences"
New-Item -ItemType Junction -Path "camera bookmarks" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\camera bookmarks"
New-Item -ItemType Junction -Path "custom_keys" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\custom_keys"
New-Item -ItemType Junction -Path "event_feed" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\event_feed"
New-Item -ItemType Junction -Path "maps" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\maps"
New-Item -ItemType Junction -Path "replays" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\replays"
New-Item -ItemType Junction -Path "save_games" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\save_games"
<#scripts covers the main game settings#>
New-Item -ItemType Junction -Path "scripts" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\scripts"


<########## Total War: Warhammer III ##########>
Set-Location ..
Set-Location "Warhammer3"

cmd /c rmdir /s /q "advice_history"
cmd /c rmdir /s /q "auth"
cmd /c rmdir /s /q "battle_preferences"
cmd /c rmdir /s /q "custom_keys"
cmd /c rmdir /s /q "event_feed"
cmd /c rmdir /s /q "ingame_messaging"
cmd /c rmdir /s /q "maps"
cmd /c rmdir /s /q "replays"
cmd /c rmdir /s /q "resume"
cmd /c rmdir /s /q "saved_characters"
cmd /c rmdir /s /q "save_games"
cmd /c rmdir /s /q "screenshots"
cmd /c rmdir /s /q "scripts"

New-Item -ItemType Junction -Path "advice_history" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\advice_history"
New-Item -ItemType Junction -Path "auth" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\auth"
New-Item -ItemType Junction -Path "battle_preferences" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\battle_preferences"
New-Item -ItemType Junction -Path "custom_keys" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\custom_keys"
New-Item -ItemType Junction -Path "event_feed" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\event_feed"
New-Item -ItemType Junction -Path "ingame_messaging" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\ingame_messaging"
New-Item -ItemType Junction -Path "maps" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\maps"
New-Item -ItemType Junction -Path "replays" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\replays"
New-Item -ItemType Junction -Path "resume" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\resume"
New-Item -ItemType Junction -Path "saved_characters" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\saved_characters"
New-Item -ItemType Junction -Path "save_games" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\save_games"
New-Item -ItemType Junction -Path "screenshots" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\screenshots"
New-Item -ItemType Junction -Path "scripts" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\scripts"





<########## Lycia OneDrive ##########>
Set-Location "D:\OneDrive\Lycia Pintella\OneDrive\OneDrive Files\Total War Backups - Lycia\Total War Settings Backup\Total War Settings Auto Backup"

<########## Total War: Pharaoh Dynasties ##########>
Set-Location "PharaohDynasties"

cmd /c rmdir /s /q "advice_history"
cmd /c rmdir /s /q "army_setups"
cmd /c rmdir /s /q "auth"
cmd /c rmdir /s /q "battle_preferences"
cmd /c rmdir /s /q "camera bookmarks"
cmd /c rmdir /s /q "custom_keys"
cmd /c rmdir /s /q "event_feed"
cmd /c rmdir /s /q "ingame_messaging"
cmd /c rmdir /s /q "maps"
cmd /c rmdir /s /q "replays"
cmd /c rmdir /s /q "resume"
cmd /c rmdir /s /q "save_games"
cmd /c rmdir /s /q "scripts"

New-Item -ItemType Junction -Path "advice_history" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\advice_history"
New-Item -ItemType Junction -Path "army_setups" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\army_setups"
New-Item -ItemType Junction -Path "auth" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\auth"
New-Item -ItemType Junction -Path "battle_preferences" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\battle_preferences"
New-Item -ItemType Junction -Path "camera bookmarks" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\camera bookmarks"
New-Item -ItemType Junction -Path "custom_keys" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\custom_keys"
New-Item -ItemType Junction -Path "event_feed" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\event_feed"
New-Item -ItemType Junction -Path "ingame_messaging" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\ingame_messaging"
New-Item -ItemType Junction -Path "maps" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\maps"
New-Item -ItemType Junction -Path "replays" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\replays"
New-Item -ItemType Junction -Path "resume" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\resume"
New-Item -ItemType Junction -Path "save_games" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\save_games"
<#scripts covers the main game settings#>
New-Item -ItemType Junction -Path "scripts" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\PharaohDynasties\scripts"

<########## Total War: Three Kingdoms ##########>
Set-Location ..
Set-Location "ThreeKingdoms"

cmd /c rmdir /s /q "advice_history"
cmd /c rmdir /s /q "auth"
cmd /c rmdir /s /q "battle_preferences"
cmd /c rmdir /s /q "camera bookmarks"
cmd /c rmdir /s /q "custom_keys"
cmd /c rmdir /s /q "event_feed"
cmd /c rmdir /s /q "maps"
cmd /c rmdir /s /q "replays"
cmd /c rmdir /s /q "save_games"
cmd /c rmdir /s /q "scripts"

New-Item -ItemType Junction -Path "advice_history" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\advice_history"
New-Item -ItemType Junction -Path "auth" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\auth"
New-Item -ItemType Junction -Path "battle_preferences" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\battle_preferences"
New-Item -ItemType Junction -Path "camera bookmarks" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\camera bookmarks"
New-Item -ItemType Junction -Path "custom_keys" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\custom_keys"
New-Item -ItemType Junction -Path "event_feed" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\event_feed"
New-Item -ItemType Junction -Path "maps" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\maps"
New-Item -ItemType Junction -Path "replays" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\replays"
New-Item -ItemType Junction -Path "save_games" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\save_games"
<#scripts covers the main game settings#>
New-Item -ItemType Junction -Path "scripts" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\ThreeKingdoms\scripts"


<########## Total War: Warhammer III ##########>
Set-Location ..
Set-Location "Warhammer3"

cmd /c rmdir /s /q "advice_history"
cmd /c rmdir /s /q "auth"
cmd /c rmdir /s /q "battle_preferences"
cmd /c rmdir /s /q "custom_keys"
cmd /c rmdir /s /q "event_feed"
cmd /c rmdir /s /q "ingame_messaging"
cmd /c rmdir /s /q "maps"
cmd /c rmdir /s /q "replays"
cmd /c rmdir /s /q "resume"
cmd /c rmdir /s /q "saved_characters"
cmd /c rmdir /s /q "save_games"
cmd /c rmdir /s /q "screenshots"
cmd /c rmdir /s /q "scripts"

New-Item -ItemType Junction -Path "advice_history" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\advice_history"
New-Item -ItemType Junction -Path "auth" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\auth"
New-Item -ItemType Junction -Path "battle_preferences" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\battle_preferences"
New-Item -ItemType Junction -Path "custom_keys" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\custom_keys"
New-Item -ItemType Junction -Path "event_feed" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\event_feed"
New-Item -ItemType Junction -Path "ingame_messaging" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\ingame_messaging"
New-Item -ItemType Junction -Path "maps" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\maps"
New-Item -ItemType Junction -Path "replays" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\replays"
New-Item -ItemType Junction -Path "resume" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\resume"
New-Item -ItemType Junction -Path "saved_characters" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\saved_characters"
New-Item -ItemType Junction -Path "save_games" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\save_games"
New-Item -ItemType Junction -Path "screenshots" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\screenshots"
New-Item -ItemType Junction -Path "scripts" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\scripts"







