# Continuous particle effects when transformed
# Base pink aura
particle minecraft:dust 1.0 0.4 0.7 1.0 ~ ~1 ~ 0.3 0.5 0.3 0 3

# Black energy mixed with pink (using dark gray to represent black energy)
particle minecraft:dust 0.2 0.0 0.1 1.0 ~ ~1 ~ 0.3 0.5 0.3 0 2

# Divine energy particles (end rod with custom motion)
execute if predicate minecraft:random_chance_0_2 run particle minecraft:end_rod ~ ~1 ~ 0.3 0.5 0.3 0.05 1

# Black-pink flame effect (alternating colors)
execute if score @s ssrose.particles matches 0..3 run particle minecraft:dust 1.0 0.4 0.7 1.2 ~ ~1.3 ~ 0.2 0.2 0.2 0.03 2
execute if score @s ssrose.particles matches 4..7 run particle minecraft:dust 0.2 0.0 0.1 1.2 ~ ~1.3 ~ 0.2 0.2 0.2 0.03 2

# Black lightning effect (rare)
execute if predicate minecraft:random_chance_0_01 run particle minecraft:flash ~ ~1 ~ 0 0 0 0 1

# Particle counter for animation timing
scoreboard players add @s ssrose.particles 1
execute if score @s ssrose.particles matches 20.. run scoreboard players set @s ssrose.particles 0

# Divine energy spirals (using sine/cosine simulation)
# Rising energy particles - divine energy spiral pattern
execute if score @s ssrose.particles matches 0 run particle minecraft:dust 1.0 0.4 0.7 1.0 ~0.3 ~0.1 ~ 0 1 0 0.02 3
execute if score @s ssrose.particles matches 0 run particle minecraft:dust 0.2 0.0 0.1 1.0 ~0.3 ~0.3 ~ 0 1 0 0.02 2

execute if score @s ssrose.particles matches 5 run particle minecraft:dust 1.0 0.4 0.7 1.0 ~-0.3 ~0.1 ~ 0 1 0 0.02 3
execute if score @s ssrose.particles matches 5 run particle minecraft:dust 0.2 0.0 0.1 1.0 ~-0.3 ~0.3 ~ 0 1 0 0.02 2

execute if score @s ssrose.particles matches 10 run particle minecraft:dust 1.0 0.4 0.7 1.0 ~ ~0.1 ~0.3 0 1 0 0.02 3
execute if score @s ssrose.particles matches 10 run particle minecraft:dust 0.2 0.0 0.1 1.0 ~ ~0.3 ~0.3 0 1 0 0.02 2

execute if score @s ssrose.particles matches 15 run particle minecraft:dust 1.0 0.4 0.7 1.0 ~ ~0.1 ~-0.3 0 1 0 0.02 3
execute if score @s ssrose.particles matches 15 run particle minecraft:dust 0.2 0.0 0.1 1.0 ~ ~0.3 ~-0.3 0 1 0 0.02 2

# Floating divine energy (appearing above the player)
execute if score @s ssrose.particles matches 0 run particle minecraft:dust 1.0 0.4 0.7 1.0 ~ ~2.3 ~ 0.2 0.1 0.2 0 3
execute if score @s ssrose.particles matches 10 run particle minecraft:dust 0.2 0.0 0.1 1.0 ~ ~2.4 ~ 0.2 0.1 0.2 0 2