# Check Sukuna flag and set scoreboard (1 = is Sukuna, 0 = not Sukuna)
execute store result score @s IsSukuna run data get entity @s ForgeCaps."jujutsucraft:player_variables".flag_sukuna

# Display result
tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Sukuna Status","color":"red"}]
tellraw @s ["",{"text":"IsSukuna = ","color":"gray"},{"score":{"name":"@s","objective":"IsSukuna"},"color":"yellow"}]
execute if score @s IsSukuna matches 1 run tellraw @s ["",{"text":"Status: ","color":"gray"},{"text":"ACTIVE","color":"red","bold":true}]
execute if score @s IsSukuna matches 0 run tellraw @s ["",{"text":"Status: ","color":"gray"},{"text":"INACTIVE","color":"gray"}]

# Raw NBT data display
tellraw @s ["",{"text":"Raw NBT Data: ","color":"dark_gray"}]
data get entity @s ForgeCaps."jujutsucraft:player_variables".flag_sukuna