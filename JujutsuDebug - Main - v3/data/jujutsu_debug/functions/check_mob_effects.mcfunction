# Setup
scoreboard objectives add s_temp dummy
scoreboard players set @s MobRct 0
scoreboard players set @s MobRctAmplifier -1 
scoreboard players set @s MobZone 0
scoreboard players set @s MobZoneAmplifier -1
scoreboard players set @s MobDomainExpansion 0

# Display header
tellraw @p ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Mob Effects Status","color":"yellow"}]
tellraw @p ["",{"text":"Entity: ","color":"gray"},{"selector":"@s","color":"yellow"}]

# Check RCT effect (Id:79)
execute if entity @s[nbt={ActiveEffects:[{Id:79}]}] run scoreboard players set @s MobRct 1
execute if score @s MobRct matches 1.. store result score @s MobRctAmplifier run data get entity @s ActiveEffects[{Id:79}].Amplifier
tellraw @p ["",{"text":"RCT Effect: ","color":"gray"},{"score":{"name":"@s","objective":"MobRct"},"color":"yellow"},{"text":", Amplifier: ","color":"gray"},{"score":{"name":"@s","objective":"MobRctAmplifier"},"color":"yellow"}]

# Check Zone effect (Id:68)
execute if entity @s[nbt={ActiveEffects:[{Id:68}]}] run scoreboard players set @s MobZone 1
execute if score @s MobZone matches 1.. store result score @s MobZoneAmplifier run data get entity @s ActiveEffects[{Id:68}].Amplifier
tellraw @p ["",{"text":"Zone Effect: ","color":"gray"},{"score":{"name":"@s","objective":"MobZone"},"color":"yellow"},{"text":", Amplifier: ","color":"gray"},{"score":{"name":"@s","objective":"MobZoneAmplifier"},"color":"yellow"}]

# Check Domain Expansion effect (Id:65)
execute if entity @s[nbt={ActiveEffects:[{Id:65}]}] run scoreboard players set @s MobDomainExpansion 1
tellraw @p ["",{"text":"Domain Expansion: ","color":"gray"},{"score":{"name":"@s","objective":"MobDomainExpansion"},"color":"yellow"}]
