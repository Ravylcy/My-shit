# Check mob skill charge level from ForgeData.cnt6
scoreboard objectives add MobChargeLevel dummy "Mob Skill Charge Level"
execute store result score @s MobChargeLevel run data get entity @s ForgeData.cnt6

# Display results
tellraw @p ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Mob Skill Charge Data","color":"dark_green"}]
tellraw @p ["",{"text":"Entity: ","color":"gray"},{"selector":"@s","color":"yellow"}]
tellraw @p ["",{"text":"Charge Level = ","color":"gray"},{"score":{"name":"@s","objective":"MobChargeLevel"},"color":"yellow"}]

# Raw NBT data display
tellraw @p ["",{"text":"Raw NBT Data: ","color":"dark_gray"}]
tellraw @p ["",{"text":"Charge: ","color":"dark_gray"}]
data get entity @s ForgeData.cnt6