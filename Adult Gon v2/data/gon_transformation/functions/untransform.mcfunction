# This is the enhanced untransform.mcfunction file

# Play untransformation effects - more dramatic
playsound minecraft:entity.elder_guardian.curse player @a[distance=..24] ~ ~ ~ 1.2 0.6
playsound minecraft:block.respawn_anchor.set_spawn player @a[distance=..24] ~ ~ ~ 1.2 0.6
playsound minecraft:entity.player.hurt player @a[distance=..24] ~ ~ ~ 1 0.5
playsound minecraft:entity.illusioner.mirror_move player @a[distance=..24] ~ ~ ~ 1 0.7

# Dramatic visual collapse effects
particle minecraft:large_smoke ~ ~1 ~ 0.5 1 0.5 0.1 100 force
particle minecraft:ash ~ ~1.5 ~ 0.5 1 0.5 0.1 100 force
particle minecraft:squid_ink ~ ~1.5 ~ 0.3 1 0.3 0.05 50 force
particle minecraft:explosion ~ ~1 ~ 0.3 0.5 0.3 0 3 force

# Create silhouette dissipation effect
particle minecraft:dust 0 0 0 2.0 ~ ~1 ~ 0.5 1 0.5 0.05 100 force
particle minecraft:dust 0 0 0 1.5 ~ ~1 ~ 0.6 0.6 0.6 0.05 100 force

# Remove attribute modifiers
attribute @s minecraft:generic.max_health modifier remove d63797b4-14c6-4f33-86d0-395c41d9db1a
attribute @s minecraft:generic.attack_damage modifier remove d63797b4-14c6-4f33-86d0-395c41d9db1b
attribute @s minecraft:generic.armor modifier remove d63797b4-14c6-4f33-86d0-395c41d9db1c
attribute @s minecraft:generic.movement_speed modifier remove d63797b4-14c6-4f33-86d0-395c41d9db1d
attribute @s minecraft:generic.knockback_resistance modifier remove d63797b4-14c6-4f33-86d0-395c41d9db1e

# Apply severe post-transformation fatigue (like in the anime)
effect give @s minecraft:weakness 120 1 true
effect give @s minecraft:slowness 90 1 true
effect give @s minecraft:mining_fatigue 100 1 true
effect give @s minecraft:nausea 30 0 true

# Reset transformation state
scoreboard players set @s gon_transform 0
scoreboard players set @s gon_transform_time 0

# Set cooldown (10 minutes = 12000 ticks)
scoreboard players set @s gon_cooldown 12000

# Display message
title @s times 20 60 20
title @s title {"text":"COVENANT PRICE","color":"dark_red"}
title @s subtitle {"text":"Your body pays the price for power","color":"red","italic":true}

# Display message about consequences
tellraw @s {"text":"You feel your life force drained...","color":"dark_red","italic":true,"bold":true}
tellraw @s {"text":"The covenant has taken its toll.","color":"red","italic":true}