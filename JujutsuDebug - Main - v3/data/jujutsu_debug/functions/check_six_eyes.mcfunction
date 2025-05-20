# Check Six Eyes flag and set scoreboard (1 = has Six Eyes, 0 = doesn't have Six Eyes)
execute store result score @s SixEyes run data get entity @s ForgeCaps."jujutsucraft:player_variables".FlagSixEyes

# Display result
tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Six Eyes Status","color":"aqua"}]
tellraw @s ["",{"text":"SixEyes = ","color":"gray"},{"score":{"name":"@s","objective":"SixEyes"},"color":"yellow"}]
execute if score @s SixEyes matches 1 run tellraw @s ["",{"text":"Status: ","color":"gray"},{"text":"ACTIVE","color":"aqua","bold":true}]
execute if score @s SixEyes matches 0 run tellraw @s ["",{"text":"Status: ","color":"gray"},{"text":"INACTIVE","color":"gray"}]

# Raw NBT data display
tellraw @s ["",{"text":"Raw NBT Data: ","color":"dark_gray"}]
data get entity @s ForgeCaps."jujutsucraft:player_variables".FlagSixEyes