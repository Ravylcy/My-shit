# Check mob skills from ForgeData
scoreboard objectives add MobSkill dummy "Mob Skill ID"
execute store result score @s MobSkill run data get entity @s ForgeData.skill

# Display results
tellraw @p ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Mob Skill Data","color":"dark_green"}]
tellraw @p ["",{"text":"Entity: ","color":"gray"},{"selector":"@s","color":"yellow"}]
tellraw @p ["",{"text":"Skill ID = ","color":"gray"},{"score":{"name":"@s","objective":"MobSkill"},"color":"yellow"}]

# Raw NBT data display
tellraw @p ["",{"text":"Raw NBT Data: ","color":"dark_gray"}]
tellraw @p ["",{"text":"Skill: ","color":"dark_gray"}]
data get entity @s ForgeData.skill