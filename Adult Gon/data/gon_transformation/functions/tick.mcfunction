# Re-enable trigger for all players
scoreboard players enable @a gon_trigger

# Check if a player has triggered the command
execute as @a[scores={gon_trigger=1..}] run function gon_transformation:give_items
execute as @a[scores={gon_trigger=1..}] run scoreboard players set @s gon_trigger 0

# Check for transformation trigger (holding nether star and sneaking for 5 seconds)
execute as @a[nbt={SelectedItem:{id:"minecraft:nether_star",tag:{GonTransformation:1b}}},predicate=gon_transformation:is_sneaking] at @s run function gon_transformation:check_transformation

# Visual effects and attribute updates for transformed players
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] at @s run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.6 0.3 0.01 3 force
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] at @s run particle minecraft:end_rod ~ ~1 ~ 0.4 0.7 0.4 0.01 1 force

# Count down transformation time
execute as @a[scores={gon_transform=1,gon_transform_time=1..}] run scoreboard players remove @s gon_transform_time 1

# Handle transformation end
execute as @a[scores={gon_transform=1,gon_transform_time=0}] at @s run function gon_transformation:untransform

# Reset charge progress if player stops sneaking or switches item
execute as @a[scores={gon_transform_time_charge=1..99}] unless entity @s[nbt={SelectedItem:{id:"minecraft:nether_star",tag:{GonTransformation:1b}}},predicate=gon_transformation:is_sneaking] run scoreboard players set @s gon_transform_time_charge 0

# Cooldown counter
execute as @a[scores={gon_cooldown=1..}] run scoreboard players remove @s gon_cooldown 1