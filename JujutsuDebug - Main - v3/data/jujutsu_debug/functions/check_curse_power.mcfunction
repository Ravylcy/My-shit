# Check player curse power from ForgeCaps
scoreboard objectives add CursePower dummy "Player Curse Power"
execute store result score @s CursePower run data get entity @s ForgeCaps."jujutsucraft:player_variables".PlayerCursePower

# Display results
tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Curse Power Data","color":"dark_green"}]
tellraw @s ["",{"text":"Curse Power = ","color":"gray"},{"score":{"name":"@s","objective":"CursePower"},"color":"yellow"}]

# Raw NBT data display
tellraw @s ["",{"text":"Raw NBT Data: ","color":"dark_gray"}]
tellraw @s ["",{"text":"Curse Power: ","color":"dark_gray"}]
data get entity @s ForgeCaps."jujutsucraft:player_variables".PlayerCursePower