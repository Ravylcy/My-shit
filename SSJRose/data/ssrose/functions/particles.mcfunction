# Continuous particle effects when transformed
# Pink aura particles
particle minecraft:dust 1.0 0.4 0.7 1.0 ~ ~1 ~ 0.3 0.5 0.3 0 3
# Occasional energy burst
execute if predicate minecraft:random_chance_0_2 run particle minecraft:end_rod ~ ~1 ~ 0.3 0.5 0.3 0.05 1
# Lightning effect (rare)
execute if predicate minecraft:random_chance_0_01 run particle minecraft:flash ~ ~1 ~ 0 0 0 0 1
# Energy spirals
scoreboard players add @s ssrose.particles 1
execute if score @s ssrose.particles matches 20.. run scoreboard players set @s ssrose.particles 0

# Rising energy particles
execute if score @s ssrose.particles matches 0 run particle minecraft:dust 1.0 0.4 0.7 1.0 ~0.3 ~0.1 ~ 0 1 0 0.02 5
execute if score @s ssrose.particles matches 5 run particle minecraft:dust 1.0 0.4 0.7 1.0 ~-0.3 ~0.1 ~ 0 1 0 0.02 5
execute if score @s ssrose.particles matches 10 run particle minecraft:dust 1.0 0.4 0.7 1.0 ~ ~0.1 ~0.3 0 1 0 0.02 5
execute if score @s ssrose.particles matches 15 run particle minecraft:dust 1.0 0.4 0.7 1.0 ~ ~0.1 ~-0.3 0 1 0 0.02 5
