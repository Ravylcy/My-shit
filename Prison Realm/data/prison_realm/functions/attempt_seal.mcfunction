# Find the nearest player within 5 blocks who is not the user
tag @s add sealer
execute as @p[distance=0.1..5,tag=!sealer] run tag @s add target

# Check if there's a valid target
execute if entity @e[tag=target,limit=1] run function prison_realm:seal
execute unless entity @e[tag=target,limit=1] run tellraw @s {"text":"No valid target found within range","color":"red"}

# Remove tags
tag @s remove sealer
tag @e[tag=target] remove target