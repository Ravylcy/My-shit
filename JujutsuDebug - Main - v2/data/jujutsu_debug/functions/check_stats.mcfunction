# Get Fame and Level
execute store result score @s Fame run data get entity @s ForgeCaps."jujutsucraft:player_variables".PlayerFame
execute store result score @s PlayerLevel run data get entity @s ForgeCaps."jujutsucraft:player_variables".PlayerLevel

# Display results
tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Player Stats","color":"green"}]
tellraw @s ["",{"text":"Fame = ","color":"gray"},{"score":{"name":"@s","objective":"Fame"},"color":"yellow"}]
tellraw @s ["",{"text":"Level = ","color":"gray"},{"score":{"name":"@s","objective":"PlayerLevel"},"color":"yellow"}]

# Raw NBT data display
tellraw @s ["",{"text":"Raw NBT Data: ","color":"dark_gray"}]
tellraw @s ["",{"text":"Fame: ","color":"dark_gray"}]
data get entity @s ForgeCaps."jujutsucraft:player_variables".PlayerFame
tellraw @s ["",{"text":"Level: ","color":"dark_gray"}]
data get entity @s ForgeCaps."jujutsucraft:player_variables".PlayerLevel