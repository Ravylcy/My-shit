# Setup
scoreboard objectives add s_temp dummy
scoreboard players set @s SukunaAmplifier -1
scoreboard players set @s SixEyesAmplifier -1
scoreboard players set @s Rct 0
scoreboard players set @s RctAmplifier -1
scoreboard players set @s Zone 0
scoreboard players set @s ZoneAmplifier -1
scoreboard players set @s DomainExpansion 0

# Display header
tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Effects Status","color":"yellow"}]

# Check Sukuna effect (Id:86)
execute if entity @s[nbt={ActiveEffects:[{Id:86}]}] run scoreboard players set @s s_temp 1
execute if score @s s_temp matches 1.. store result score @s SukunaAmplifier run data get entity @s ActiveEffects[{Id:86}].Amplifier
tellraw @s ["",{"text":"Sukuna Effect: ","color":"gray"},{"score":{"name":"@s","objective":"s_temp"},"color":"yellow"},{"text":", Amplifier: ","color":"gray"},{"score":{"name":"@s","objective":"SukunaAmplifier"},"color":"yellow"}]

# Check Six Eyes effect (Id:72)
scoreboard players set @s s_temp 0
execute if entity @s[nbt={ActiveEffects:[{Id:72}]}] run scoreboard players set @s s_temp 1
execute if score @s s_temp matches 1.. store result score @s SixEyesAmplifier run data get entity @s ActiveEffects[{Id:72}].Amplifier
tellraw @s ["",{"text":"Six Eyes Effect: ","color":"gray"},{"score":{"name":"@s","objective":"s_temp"},"color":"yellow"},{"text":", Amplifier: ","color":"gray"},{"score":{"name":"@s","objective":"SixEyesAmplifier"},"color":"yellow"}]

# Check RCT effect (Id:79)
scoreboard players set @s Rct 0
execute if entity @s[nbt={ActiveEffects:[{Id:79}]}] run scoreboard players set @s Rct 1
execute if score @s Rct matches 1.. store result score @s RctAmplifier run data get entity @s ActiveEffects[{Id:79}].Amplifier
tellraw @s ["",{"text":"RCT Effect: ","color":"gray"},{"score":{"name":"@s","objective":"Rct"},"color":"yellow"},{"text":", Amplifier: ","color":"gray"},{"score":{"name":"@s","objective":"RctAmplifier"},"color":"yellow"}]

# Check Zone effect (Id:68)
scoreboard players set @s Zone 0
execute if entity @s[nbt={ActiveEffects:[{Id:68}]}] run scoreboard players set @s Zone 1
execute if score @s Zone matches 1.. store result score @s ZoneAmplifier run data get entity @s ActiveEffects[{Id:68}].Amplifier
tellraw @s ["",{"text":"Zone Effect: ","color":"gray"},{"score":{"name":"@s","objective":"Zone"},"color":"yellow"},{"text":", Amplifier: ","color":"gray"},{"score":{"name":"@s","objective":"ZoneAmplifier"},"color":"yellow"}]

# Check Domain Expansion effect (Id:65)
scoreboard players set @s DomainExpansion 0
execute if entity @s[nbt={ActiveEffects:[{Id:65}]}] run scoreboard players set @s DomainExpansion 1
tellraw @s ["",{"text":"Domain Expansion: ","color":"gray"},{"score":{"name":"@s","objective":"DomainExpansion"},"color":"yellow"}]

# Clean up temp score
scoreboard objectives remove s_temp
