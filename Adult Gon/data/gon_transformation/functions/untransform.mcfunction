# Play untransformation effects
playsound minecraft:entity.elder_guardian.curse player @a[distance=..16] ~ ~ ~ 1 0.7
playsound minecraft:block.respawn_anchor.set_spawn player @a[distance=..16] ~ ~ ~ 1 0.7
particle minecraft:large_smoke ~ ~1 ~ 0.3 0.6 0.3 0.05 50 force

# Remove attribute modifiers
attribute @s minecraft:generic.max_health modifier remove d63797b4-14c6-4f33-86d0-395c41d9db1a
attribute @s minecraft:generic.attack_damage modifier remove d63797b4-14c6-4f33-86d0-395c41d9db1b
attribute @s minecraft:generic.armor modifier remove d63797b4-14c6-4f33-86d0-395c41d9db1c
attribute @s minecraft:generic.movement_speed modifier remove d63797b4-14c6-4f33-86d0-395c41d9db1d
attribute @s minecraft:generic.knockback_resistance modifier remove d63797b4-14c6-4f33-86d0-395c41d9db1e

# Apply temporary weakness and slowness as post-transformation fatigue
effect give @s minecraft:weakness 30 0 true
effect give @s minecraft:slowness 15 0 true
effect give @s minecraft:mining_fatigue 20 0 true

# Reset transformation state
scoreboard players set @s gon_transform 0
scoreboard players set @s gon_transform_time 0

# Set cooldown (5 minutes = 6000 ticks)
scoreboard players set @s gon_cooldown 6000

# Display message
title @s title {"text":"Transformation Ended","color":"gray"}
title @s subtitle {"text":"Your power returns to normal","color":"red"}
tellraw @s {"text":"You feel extremely exhausted...","color":"red","italic":true}