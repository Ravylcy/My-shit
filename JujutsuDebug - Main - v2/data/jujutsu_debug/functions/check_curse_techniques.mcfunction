# Get Curse Techniques and set scoreboards
execute store result score @s CurrentCT run data get entity @s ForgeCaps."jujutsucraft:player_variables".PlayerCurseTechnique
execute store result score @s SecondCT run data get entity @s ForgeCaps."jujutsucraft:player_variables".PlayerCurseTechnique2

# Display results
tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Curse Techniques","color":"light_purple"}]
tellraw @s ["",{"text":"Primary CT = ","color":"gray"},{"score":{"name":"@s","objective":"CurrentCT"},"color":"yellow"}]
tellraw @s ["",{"text":"Secondary CT = ","color":"gray"},{"score":{"name":"@s","objective":"SecondCT"},"color":"yellow"}]

# Raw NBT data display
tellraw @s ["",{"text":"Raw NBT Data: ","color":"dark_gray"}]
tellraw @s ["",{"text":"Primary: ","color":"dark_gray"}]
data get entity @s ForgeCaps."jujutsucraft:player_variables".PlayerCurseTechnique
tellraw @s ["",{"text":"Secondary: ","color":"dark_gray"}]
data get entity @s ForgeCaps."jujutsucraft:player_variables".PlayerCurseTechnique2