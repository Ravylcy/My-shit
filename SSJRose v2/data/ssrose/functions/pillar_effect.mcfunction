# Creates the divine energy pillar effect for SSJ Rosé transformation
# This runs for 40 ticks (2 seconds) to create the pillar effect

# Track how long the pillar has existed
scoreboard players add @s ssrose.pillar_time 1

# Create rising particles
# Pink divine energy core
particle minecraft:dust 1.0 0.4 0.7 2.0 ~ ~10 ~ 0.7 10 0.7 0 50
# Black energy mixed with pink 
particle minecraft:dust 0.2 0.0 0.1 1.8 ~ ~10 ~ 0.7 10 0.7 0 40
# Divine energy sparks
particle minecraft:end_rod ~ ~10 ~ 1 10 1 0.1 30
# Divine flames rising
particle minecraft:flame ~ ~5 ~ 0.5 5 0.5 0.05 20
particle minecraft:soul_fire_flame ~ ~5 ~ 0.5 5 0.5 0.05 10

# Add black lightning effect (sporadic flashes along the pillar)
execute if predicate minecraft:random_chance_0_1 run particle minecraft:flash ~ ~10 ~ 0.5 10 0.5 0 3

# Create dome of energy at the top of the pillar
particle minecraft:dust 1.0 0.4 0.7 1.5 ~ ~20 ~ 3 0.5 3 0 20
particle minecraft:dust 0.2 0.0 0.1 1.3 ~ ~20 ~ 3 0.5 3 0 15

# Sound effects continuing through the pillar
playsound minecraft:block.beacon.ambient player @a ~ ~ ~ 0.5 1.2

# Kill the stand after 40 ticks (2 seconds)
execute if score @s ssrose.pillar_time matches 40.. run kill @s