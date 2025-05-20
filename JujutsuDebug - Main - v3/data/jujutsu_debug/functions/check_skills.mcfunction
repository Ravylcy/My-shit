# Check player skills from ForgeData
scoreboard objectives add PlayerSkill dummy
execute store result score @s PlayerSkill run data get entity @s ForgeData.skill

# Display results
tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Player Skill Data","color":"dark_green"}]
tellraw @s ["",{"text":"Skill ID = ","color":"gray"},{"score":{"name":"@s","objective":"PlayerSkill"},"color":"yellow"}]

# Raw NBT data display
tellraw @s ["",{"text":"Raw NBT Data: ","color":"dark_gray"}]
tellraw @s ["",{"text":"Skill: ","color":"dark_gray"}]
data get entity @s ForgeData.skill