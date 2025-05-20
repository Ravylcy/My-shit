# This is the enhanced tick.mcfunction file

# Re-enable trigger for all players
scoreboard players enable @a gon_trigger

# Check if a player has triggered the command
execute as @a[scores={gon_trigger=1..}] run function gon_transformation:give_items
execute as @a[scores={gon_trigger=1..}] run scoreboard players set @s gon_trigger 0

# Check for transformation trigger (holding nether star and sneaking for 5 seconds)
execute as @a[nbt={SelectedItem:{id:"minecraft:nether_star",tag:{GonTransformation:1b}}},predicate=gon_transformation:is_sneaking] at @s run function gon_transformation:check_transformation

# Enhanced visual effects for transformed players
# Black silhouette and black aura particles around the player
# Optimized particle effects for performance
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] at @s run particle minecraft:soul_fire_flame ~ ~1 ~ 0.1 0.3 0.1 0.01 1 force
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] at @s run particle minecraft:end_rod ~ ~1 ~ 0.2 0.3 0.2 0.01 1 force
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] at @s run particle minecraft:dust 0 0 0 1.2 ~ ~1 ~ 0.4 0.4 0.4 0 1 force
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] at @s run particle minecraft:dust 0 0 0 1.4 ~ ~1 ~ 0.3 0.5 0.3 0 1 force

# Footstep effects - cracks appear where the player walks
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] at @s unless block ~ ~-0.1 ~ #minecraft:air run particle minecraft:block minecraft:stone ~ ~ ~ 0.3 0 0.3 0 2 normal

# Create environmental impact
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] at @s if predicate gon_transformation:is_moving run particle minecraft:dust 0 0 0 1.0 ~ ~0.1 ~ 0.2 0.1 0.2 0 1 force

# Dark aura visual for intimidation (slow rising dark particles)
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] at @s run particle minecraft:smoke ~ ~0.2 ~ 0.4 0.2 0.4 0.01 1 force

# Count down transformation time
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] run scoreboard players remove @s gon_transform_time 1

# Show remaining time
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] run title @s actionbar [{"text":"Transformation: ","color":"dark_red","bold":true},{"score":{"name":"@s","objective":"gon_transform_time"},"color":"red"},{"text":" ticks remaining","color":"red"}]

# Handle transformation end
execute as @a[scores={gon_transform=1,gon_transform_time=0}] at @s run function gon_transformation:untransform

# Reset charge progress if player stops sneaking or switches item
execute as @a[scores={gon_transform_time_charge=1..99}] unless entity @s[nbt={SelectedItem:{id:"minecraft:nether_star",tag:{GonTransformation:1b}}},predicate=gon_transformation:is_sneaking] run scoreboard players set @s gon_transform_time_charge 0

# Cooldown counter
execute as @a[scores={gon_cooldown=1..}] run scoreboard players remove @s gon_cooldown 1

# Display cooldown status
execute as @a[scores={gon_cooldown=1..}] run title @s actionbar [{"text":"Transformation Cooldown: ","color":"gray"},{"score":{"name":"@s","objective":"gon_cooldown"},"color":"red"},{"text":" ticks remaining","color":"gray"}]
