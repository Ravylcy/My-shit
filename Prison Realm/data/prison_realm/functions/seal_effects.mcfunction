# Apply debuffs to sealed players
effect give @s minecraft:blindness 3 0 true
effect give @s minecraft:slowness 3 1 true
effect give @s minecraft:weakness 3 0 true
effect give @s minecraft:mining_fatigue 3 2 true

# Add ambient particles
execute at @s run particle minecraft:ash ~ ~1 ~ 3 3 3 0.01 1 force @s

# Prevent teleporting out of the prison realm
execute unless entity @e[type=armor_stand,tag=prison_realm_center,distance=..100] run tp @s @e[type=armor_stand,tag=prison_realm_center,limit=1]
