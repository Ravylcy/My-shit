# This function creates an enhanced silhouette effect for Adult Gon
# Creates a dark aura around the player to simulate the black silhouette from the anime

# Create intense black silhouette particles surrounding the player
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] at @s run particle minecraft:dust 0 0 0 2.0 ~ ~1.0 ~ 0.4 1.0 0.4 0 10 force
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] at @s run particle minecraft:dust 0 0 0 1.8 ~ ~0.5 ~ 0.4 0.5 0.4 0 5 force 
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] at @s run particle minecraft:dust 0 0 0 1.8 ~ ~1.5 ~ 0.4 0.5 0.4 0 5 force

# Black smoke effect to create depth and volume to the silhouette
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] at @s run particle minecraft:squid_ink ~ ~1.0 ~ 0.4 0.8 0.4 0.01 5 force
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] at @s run particle minecraft:large_smoke ~ ~1.0 ~ 0.4 0.8 0.4 0.01 3 force

# Dark red aura interacting with black silhouette (as seen in anime)
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] at @s run particle minecraft:dust 0.6 0.0 0.0 1.2 ~ ~1.0 ~ 0.6 0.9 0.6 0 3 force

# Occasional energy pulses for dramatic effect
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] at @s if predicate gon_transformation:random_chance run particle minecraft:soul_fire_flame ~ ~1.0 ~ 0.5 0.9 0.5 0.05 5 force
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] at @s if predicate gon_transformation:random_chance run particle minecraft:end_rod ~ ~1.0 ~ 0.5 0.9 0.5 0.05 2 force

# Schedule this function to run again in 5 ticks if any player is transformed
execute if entity @a[scores={gon_transform=1,gon_transform_time=1..}] run schedule function gon_transformation:silhouette_effect 5t