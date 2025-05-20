# Update all mob scores without displaying info
# This can be used in tick function to constantly update mob scores

# Track skill from ForgeData
execute store result score @s MobSkill run data get entity @s ForgeData.skill
# Track charging level from ForgeData.cnt6
execute store result score @s MobChargeLevel run data get entity @s ForgeData.cnt6

# Set up effect status flags
scoreboard players set @s MobRct 0
scoreboard players set @s MobRctAmplifier -1
scoreboard players set @s MobZone 0
scoreboard players set @s MobZoneAmplifier -1
scoreboard players set @s MobDomainExpansion 0

# RCT effect check
execute if entity @s[nbt={ActiveEffects:[{Id:79}]}] run scoreboard players set @s MobRct 1
execute if score @s MobRct matches 1.. store result score @s MobRctAmplifier run data get entity @s ActiveEffects[{Id:79}].Amplifier

# Zone effect check
execute if entity @s[nbt={ActiveEffects:[{Id:68}]}] run scoreboard players set @s MobZone 1
execute if score @s MobZone matches 1.. store result score @s MobZoneAmplifier run data get entity @s ActiveEffects[{Id:68}].Amplifier

# Domain Expansion effect check
execute if entity @s[nbt={ActiveEffects:[{Id:65}]}] run scoreboard players set @s MobDomainExpansion 1

# v2/data/jujutsu_debug/functions/setup_mob_scoreboards.mcfunction
# Create all necessary mob debug scoreboards
scoreboard objectives add MobSkill dummy "Mob Skill ID"
scoreboard objectives add MobChargeLevel dummy "Mob Skill Charge Level"
scoreboard objectives add MobRct dummy "Has RCT Effect"
scoreboard objectives add MobRctAmplifier dummy "RCT Amplifier"
scoreboard objectives add MobZone dummy "Has Zone Effect"
scoreboard objectives add MobZoneAmplifier dummy "Zone Amplifier"
scoreboard objectives add MobDomainExpansion dummy "Has Domain Expansion"

tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Mob Scoreboards created!","color":"green"}]
tellraw @s ["",{"text":"Run checks with: ","color":"gray"}]
tellraw @s ["",{"text":" - ","color":"dark_gray"},{"text":"/execute as @e[type=!player] run function jujutsu_debug:check_mob_skills","color":"aqua","clickEvent":{"action":"suggest_command","value":"/execute as @e[type=!player] run function jujutsu_debug:check_mob_skills"}}]
tellraw @s ["",{"text":" - ","color":"dark_gray"},{"text":"/execute as @e[type=!player] run function jujutsu_debug:check_mob_charge","color":"aqua","clickEvent":{"action":"suggest_command","value":"/execute as @e[type=!player] run function jujutsu_debug:check_mob_charge"}}]
tellraw @s ["",{"text":" - ","color":"dark_gray"},{"text":"/execute as @e[type=!player] run function jujutsu_debug:check_mob_effects","color":"aqua","clickEvent":{"action":"suggest_command","value":"/execute as @e[type=!player] run function jujutsu_debug:check_mob_effects"}}]
