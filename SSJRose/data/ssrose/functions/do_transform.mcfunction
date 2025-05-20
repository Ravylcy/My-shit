# Set transformation status
scoreboard players set @s ssrose.transformed 1

# Add player to team for visual effect
team join ssrose @s

# Apply attribute modifiers
attribute @s minecraft:generic.max_health modifier add 5555-1-1-1-1 "ssrose.health" 0.5 multiply
attribute @s minecraft:generic.movement_speed modifier add 5555-1-1-1-2 "ssrose.speed" 0.4 multiply
attribute @s minecraft:generic.attack_damage modifier add 5555-1-1-1-3 "ssrose.damage" 0.7 multiply
attribute @s minecraft:generic.attack_speed modifier add 5555-1-1-1-4 "ssrose.attack_speed" 0.3 multiply
attribute @s minecraft:generic.knockback_resistance modifier add 5555-1-1-1-5 "ssrose.knockback" 0.5 add

# Visual and sound effects
playsound minecraft:entity.wither.spawn player @a ~ ~ ~ 1 1.5
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 0.8 0.5

# Initial particle burst
particle minecraft:dust 1.0 0.4 0.7 1.5 ~ ~1 ~ 0.5 1 0.5 0.1 100
particle minecraft:enchant ~ ~1 ~ 1 1 1 1 100
particle minecraft:flash ~ ~1 ~ 0 0 0 0 5
particle minecraft:end_rod ~ ~1 ~ 0.5 1 0.5 0.1 50

# Give glowing effect
effect give @s minecraft:glowing 999999 0 true

# Dramatic screen shake effect
execute as @a[distance=..20] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Duration:1,Effects:[{Id:9,Amplifier:1b,Duration:1,ShowParticles:0b}]}

# Visual feedback
title @s title {"text":"Super Saiyan Rosé","color":"light_purple","bold":true}
title @s subtitle {"text":"Transformation Complete!","color":"pink"}
tellraw @a [{"selector":"@s","color":"light_purple"},{"text":" has transformed into Super Saiyan Rosé!","color":"white"}]
