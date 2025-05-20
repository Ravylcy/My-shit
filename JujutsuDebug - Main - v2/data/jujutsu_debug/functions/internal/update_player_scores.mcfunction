# Modified update_player_scores.mcfunction that correctly sets effect status flags and tracks skill data

execute store result score @s CurrentCT run data get entity @s ForgeCaps."jujutsucraft:player_variables".PlayerCurseTechnique
execute store result score @s SecondCT run data get entity @s ForgeCaps."jujutsucraft:player_variables".PlayerCurseTechnique2

execute store result score @s Fame run data get entity @s ForgeCaps."jujutsucraft:player_variables".PlayerFame
execute store result score @s PlayerLevel run data get entity @s ForgeCaps."jujutsucraft:player_variables".PlayerLevel
execute store result score @s CursePower run data get entity @s ForgeCaps."jujutsucraft:player_variables".PlayerCursePower

execute store result score @s SixEyes run data get entity @s ForgeCaps."jujutsucraft:player_variables".FlagSixEyes

execute store result score @s IsSukuna run data get entity @s ForgeCaps."jujutsucraft:player_variables".flag_sukuna

# Track skill from ForgeData
execute store result score @s PlayerSkill run data get entity @s ForgeData.skill
# Track charging level from ForgeData.cnt6
execute store result score @s ChargeLevel run data get entity @s ForgeData.cnt6

scoreboard objectives add s_temp dummy
scoreboard players set @s SukunaAmplifier -1
scoreboard players set @s SixEyesAmplifier -1
scoreboard players set @s Rct 0
scoreboard players set @s RctAmplifier -1
scoreboard players set @s Zone 0
scoreboard players set @s ZoneAmplifier -1
scoreboard players set @s DomainExpansion 0
scoreboard players set @s SukunaFingers 0 
scoreboard players set @s DeathPaintings 0

# Sukuna effect check - FIXED
execute if entity @s[nbt={ActiveEffects:[{Id:86}]}] run scoreboard players set @s s_temp 1
execute if score @s s_temp matches 1.. store result score @s SukunaAmplifier run data get entity @s ActiveEffects[{Id:86}].Amplifier
scoreboard players set @s s_temp 0

# Six Eyes effect check - FIXED
execute if entity @s[nbt={ActiveEffects:[{Id:72}]}] run scoreboard players set @s s_temp 1
execute if score @s s_temp matches 1.. store result score @s SixEyesAmplifier run data get entity @s ActiveEffects[{Id:72}].Amplifier
scoreboard players set @s s_temp 0

# RCT effect check - FIXED
execute if entity @s[nbt={ActiveEffects:[{Id:79}]}] run scoreboard players set @s Rct 1
execute if score @s Rct matches 1.. store result score @s RctAmplifier run data get entity @s ActiveEffects[{Id:79}].Amplifier

# Zone effect check - FIXED
execute if entity @s[nbt={ActiveEffects:[{Id:68}]}] run scoreboard players set @s Zone 1
execute if score @s Zone matches 1.. store result score @s ZoneAmplifier run data get entity @s ActiveEffects[{Id:68}].Amplifier

# Domain Expansion effect check - FIXED
execute if entity @s[nbt={ActiveEffects:[{Id:65}]}] run scoreboard players set @s DomainExpansion 1

execute unless score @s Grade matches 0.. run scoreboard players set @s Grade 0
execute if entity @s[advancements={jujutsucraft:sorcerer_grade_4=true}] run scoreboard players set @s Grade 1
execute if entity @s[advancements={jujutsucraft:sorcerer_grade_3=true}] run scoreboard players set @s Grade 2
execute if entity @s[advancements={jujutsucraft:sorcerer_grade_2_semi=true}] run scoreboard players set @s Grade 3
execute if entity @s[advancements={jujutsucraft:sorcerer_grade_2=true}] run scoreboard players set @s Grade 4
execute if entity @s[advancements={jujutsucraft:sorcerer_grade_1_semi=true}] run scoreboard players set @s Grade 5
execute if entity @s[advancements={jujutsucraft:sorcerer_grade_1=true}] run scoreboard players set @s Grade 6
execute if entity @s[advancements={jujutsucraft:sorcerer_grade_special=true}] run scoreboard players set @s Grade 7

execute if entity @s[advancements={jujutsucraft:reverse_cursed_technique_1=true}] run scoreboard players set @s RctUnlocked 1
execute if entity @s[advancements={jujutsucraft:reverse_cursed_technique_2=true}] run scoreboard players set @s RctUnlocked 2

execute store success score @s s_temp if data entity @s ForgeCaps."jujutsucraft:player_variables".BodyItem{id:"jujutsucraft:sukuna_finger"}
execute if score @s s_temp matches 1 store result score @s SukunaFingers run data get entity @s ForgeCaps."jujutsucraft:player_variables".BodyItem{id:"jujutsucraft:sukuna_finger"}.Count

execute store success score @s s_temp if data entity @s ForgeCaps."jujutsucraft:player_variables".BodyItem{id:"jujutsucraft:death_painting"}
execute if score @s s_temp matches 1 store result score @s DeathPaintings run data get entity @s ForgeCaps."jujutsucraft:player_variables".BodyItem{id:"jujutsucraft:death_painting"}.Count

scoreboard objectives remove s_temp