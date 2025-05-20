# Remove transformation status
scoreboard players set @s ssrose.transformed 0

# Remove player from team
team leave @s

# Remove attribute modifiers
attribute @s minecraft:generic.max_health modifier remove 5555-1-1-1-1
attribute @s minecraft:generic.movement_speed modifier remove 5555-1-1-1-2
attribute @s minecraft:generic.attack_damage modifier remove 5555-1-1-1-3
attribute @s minecraft:generic.attack_speed modifier remove 5555-1-1-1-4
attribute @s minecraft:generic.knockback_resistance modifier remove 5555-1-1-1-5

# Remove effects
effect clear @s minecraft:glowing

# Set cooldown (5 minutes = 6000 ticks)
scoreboard players set @s ssrose.cooldown 6000

# Visual and sound effects
playsound minecraft:block.beacon.deactivate player @a ~ ~ ~ 1 1.2
particle minecraft:dust 1.0 0.4 0.7 1.5 ~ ~1 ~ 0.5 1 0.5 0.1 50
particle minecraft:smoke ~ ~1 ~ 0.5 1 0.5 0.1 30

# Visual feedback
title @s title {"text":"Transformation","color":"light_purple","bold":true}
title @s subtitle {"text":"Power Depleted","color":"gray"}
tellraw @a [{"selector":"@s","color":"light_purple"},{"text":" has reverted from Super Saiyan Rosé form!","color":"white"}]