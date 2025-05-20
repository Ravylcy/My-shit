# Check player skill charge level from ForgeData.cnt6
scoreboard objectives add ChargeLevel dummy "Skill Charge Level"
execute store result score @s ChargeLevel run data get entity @s ForgeData.cnt6

# Display results
tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Skill Charge Data","color":"dark_green"}]
tellraw @s ["",{"text":"Charge Level = ","color":"gray"},{"score":{"name":"@s","objective":"ChargeLevel"},"color":"yellow"}]

# Raw NBT data display
tellraw @s ["",{"text":"Raw NBT Data: ","color":"dark_gray"}]
tellraw @s ["",{"text":"Charge: ","color":"dark_gray"}]
data get entity @s ForgeData.cnt6