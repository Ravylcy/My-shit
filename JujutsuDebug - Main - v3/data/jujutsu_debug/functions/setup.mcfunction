# Create all necessary debug scoreboards
scoreboard objectives add IsSukuna dummy "Has Sukuna Effect"
scoreboard objectives add SixEyes dummy "Has Six Eyes"
scoreboard objectives add CurrentCT dummy "Primary Curse Technique"
scoreboard objectives add SecondCT dummy "Secondary Curse Technique"
scoreboard objectives add Fame dummy "Player Fame"
scoreboard objectives add PlayerLevel dummy "Player Level"
scoreboard objectives add SukunaAmplifier dummy "Sukuna Effect Amplifier"
scoreboard objectives add SixEyesAmplifier dummy "Six Eyes Amplifier"
scoreboard objectives add Rct dummy "Has RCT Effect"
scoreboard objectives add RctAmplifier dummy "RCT Amplifier"
scoreboard objectives add Zone dummy "Has Zone Effect"
scoreboard objectives add ZoneAmplifier dummy "Zone Amplifier"
scoreboard objectives add DomainExpansion dummy "Has Domain Expansion"
scoreboard objectives add Grade dummy "Sorcerer Grade"
scoreboard objectives add RctUnlocked dummy "RCT Unlock Level"
scoreboard objectives add SukunaFingers dummy "Sukuna Fingers Consumed"
scoreboard objectives add DeathPaintings dummy "Death Paintings Consumed"
scoreboard objectives add PrevFingers dummy "Previous Finger Count"
scoreboard objectives add PrevPaintings dummy "Previous Painting Count"
scoreboard objectives add PlayerSkill dummy "Player Skill ID"
scoreboard objectives add ChargeLevel dummy "Skill Charge Level"
scoreboard objectives add CursePower dummy "Player Curse Power"

# Create all necessary mob debug scoreboards
scoreboard objectives add MobSkill dummy "Mob Skill ID"
scoreboard objectives add MobChargeLevel dummy "Mob Skill Charge Level"
scoreboard objectives add MobRct dummy "Has RCT Effect"
scoreboard objectives add MobRctAmplifier dummy "RCT Amplifier"
scoreboard objectives add MobZone dummy "Has Zone Effect"
scoreboard objectives add MobZoneAmplifier dummy "Zone Amplifier"
scoreboard objectives add MobDomainExpansion dummy "Has Domain Expansion"

tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Scoreboards created!","color":"green"}]
tellraw @s ["",{"text":"Run individual player checks with: ","color":"gray"}]
tellraw @s ["",{"text":" - ","color":"dark_gray"},{"text":"/function jujutsu_debug:check_flags","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function jujutsu_debug:check_flags"}}]
tellraw @s ["",{"text":" - ","color":"dark_gray"},{"text":"/function jujutsu_debug:check_sukuna","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function jujutsu_debug:check_sukuna"}}]
tellraw @s ["",{"text":" - ","color":"dark_gray"},{"text":"/function jujutsu_debug:check_six_eyes","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function jujutsu_debug:check_six_eyes"}}]
tellraw @s ["",{"text":" - ","color":"dark_gray"},{"text":"/function jujutsu_debug:check_curse_techniques","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function jujutsu_debug:check_curse_techniques"}}]
tellraw @s ["",{"text":" - ","color":"dark_gray"},{"text":"/function jujutsu_debug:check_stats","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function jujutsu_debug:check_stats"}}]
tellraw @s ["",{"text":" - ","color":"dark_gray"},{"text":"/function jujutsu_debug:check_effects","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function jujutsu_debug:check_effects"}}]
tellraw @s ["",{"text":" - ","color":"dark_gray"},{"text":"/function jujutsu_debug:check_advancements","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function jujutsu_debug:check_advancements"}}]
tellraw @s ["",{"text":" - ","color":"dark_gray"},{"text":"/function jujutsu_debug:check_special_items","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function jujutsu_debug:check_special_items"}}]
tellraw @s ["",{"text":" - ","color":"dark_gray"},{"text":"/function jujutsu_debug:check_skills","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function jujutsu_debug:check_skills"}}]
tellraw @s ["",{"text":" - ","color":"dark_gray"},{"text":"/function jujutsu_debug:check_charge","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function jujutsu_debug:check_charge"}}]
tellraw @s ["",{"text":" - ","color":"dark_gray"},{"text":"/function jujutsu_debug:check_curse_power","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function jujutsu_debug:check_curse_power"}}]

tellraw @s ["",{"text":"Run mob checks with: ","color":"gray"}]
tellraw @s ["",{"text":" - ","color":"dark_gray"},{"text":"/execute as @e[type=!player] run function jujutsu_debug:check_mob_skills","color":"aqua","clickEvent":{"action":"suggest_command","value":"/execute as @e[type=!player] run function jujutsu_debug:check_mob_skills"}}]
tellraw @s ["",{"text":" - ","color":"dark_gray"},{"text":"/execute as @e[type=!player] run function jujutsu_debug:check_mob_charge","color":"aqua","clickEvent":{"action":"suggest_command","value":"/execute as @e[type=!player] run function jujutsu_debug:check_mob_charge"}}]
tellraw @s ["",{"text":" - ","color":"dark_gray"},{"text":"/execute as @e[type=!player] run function jujutsu_debug:check_mob_effects","color":"aqua","clickEvent":{"action":"suggest_command","value":"/execute as @e[type=!player] run function jujutsu_debug:check_mob_effects"}}]
tellraw @s ["",{"text":" - ","color":"dark_gray"},{"text":"/function jujutsu_debug:debug_all_mobs","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function jujutsu_debug:debug_all_mobs"}}]