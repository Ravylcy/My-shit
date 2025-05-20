# Check for Sukuna Fingers and Death Paintings

# Set up temporary scores
scoreboard objectives add TempFingers dummy
scoreboard objectives add TempPaintings dummy
scoreboard players set @s SukunaFingers 0
scoreboard players set @s DeathPaintings 0

# Display header
tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Special Items","color":"dark_purple"}]
tellraw @s ["",{"text":"============================================","color":"gray"}]

# Check Sukuna Fingers
execute store success score @s TempFingers if data entity @s ForgeCaps."jujutsucraft:player_variables".BodyItem{id:"jujutsucraft:sukuna_finger"}
execute if score @s TempFingers matches 1 store result score @s SukunaFingers run data get entity @s ForgeCaps."jujutsucraft:player_variables".BodyItem{id:"jujutsucraft:sukuna_finger"}.Count

# Check Death Paintings
execute store success score @s TempPaintings if data entity @s ForgeCaps."jujutsucraft:player_variables".BodyItem{id:"jujutsucraft:death_painting"}
execute if score @s TempPaintings matches 1 store result score @s DeathPaintings run data get entity @s ForgeCaps."jujutsucraft:player_variables".BodyItem{id:"jujutsucraft:death_painting"}.Count

# Display results
tellraw @s ["",{"text":"Sukuna Fingers: ","color":"red"},{"score":{"name":"@s","objective":"SukunaFingers"},"color":"yellow"},{"text":"/20","color":"gray"}]
tellraw @s ["",{"text":"Death Paintings: ","color":"dark_aqua"},{"score":{"name":"@s","objective":"DeathPaintings"},"color":"yellow"},{"text":"/9","color":"gray"}]

# Raw NBT data display
tellraw @s ["",{"text":"Raw NBT Data: ","color":"dark_gray"}]

tellraw @s ["",{"text":"Fingers: ","color":"dark_gray"}]
execute if score @s TempFingers matches 1 run data get entity @s ForgeCaps."jujutsucraft:player_variables".BodyItem{id:"jujutsucraft:sukuna_finger"}
execute if score @s TempFingers matches 0 run tellraw @s ["",{"text":"None found","color":"gray"}]

tellraw @s ["",{"text":"Paintings: ","color":"dark_gray"}]
execute if score @s TempPaintings matches 1 run data get entity @s ForgeCaps."jujutsucraft:player_variables".BodyItem{id:"jujutsucraft:death_painting"}
execute if score @s TempPaintings matches 0 run tellraw @s ["",{"text":"None found","color":"gray"}]

tellraw @s ["",{"text":"============================================","color":"gray"}]

# Clean up temporary scores
scoreboard objectives remove TempFingers
scoreboard objectives remove TempPaintings