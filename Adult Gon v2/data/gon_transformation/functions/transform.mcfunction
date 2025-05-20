# This is the enhanced transform.mcfunction file

# Play transformation sound and effects - enhanced with more dramatic sounds
playsound minecraft:entity.wither.spawn player @a[distance=..48] ~ ~ ~ 1.5 0.6
playsound minecraft:entity.lightning_bolt.thunder player @a[distance=..48] ~ ~ ~ 1.5 0.4
playsound minecraft:block.respawn_anchor.deplete player @a[distance=..48] ~ ~ ~ 1.5 0.5
playsound minecraft:entity.ender_dragon.growl player @a[distance=..48] ~ ~ ~ 0.8 0.6
playsound minecraft:entity.warden.sonic_boom player @a[distance=..48] ~ ~ ~ 0.7 0.5

# Initial dramatic expansion effect
execute at @s run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 1 3 force
execute at @s run particle minecraft:flash ~ ~1 ~ 0 0 0 0 2 force

# Create more anime-accurate transformation sequence
# First stage - initial energy surge
execute at @s run particle minecraft:soul_fire_flame ~ ~1 ~ 0.5 1 0.5 0.3 150 force
execute at @s run particle minecraft:end_rod ~ ~1 ~ 0.7 1.2 0.7 0.1 150 force
execute at @s run particle minecraft:large_smoke ~ ~1 ~ 0.7 1.5 0.7 0.1 100 force

# Enhanced silhouette effect (black silhouette in anime)
execute at @s run particle minecraft:smoke ~ ~1 ~ 0.3 1 0.3 0.01 500 force
execute at @s run particle minecraft:squid_ink ~ ~1.5 ~ 0.3 0.8 0.3 0.1 300 force
execute at @s run particle minecraft:ash ~ ~1.5 ~ 0.4 1 0.4 0.1 400 force
execute at @s run particle minecraft:dust 0 0 0 2.0 ~ ~1.2 ~ 0.3 1.1 0.3 0 400 force

# More dense silhouette around player body
execute at @s run particle minecraft:dust 0 0 0 2.0 ~ ~0.5 ~ 0.4 0.5 0.4 0 150 force
execute at @s run particle minecraft:dust 0 0 0 2.0 ~ ~1.0 ~ 0.4 0.5 0.4 0 150 force
execute at @s run particle minecraft:dust 0 0 0 2.0 ~ ~1.5 ~ 0.4 0.5 0.4 0 150 force

# Dark red aura effect (intense energy form)
execute at @s run particle minecraft:dust 0.6 0.0 0.0 1.8 ~ ~1.2 ~ 0.8 1.2 0.8 0.05 200 force
execute at @s run particle minecraft:dust 0.6 0.0 0.0 1.5 ~ ~1.5 ~ 1 1.5 1 0.1 200 force

# Ground-breaking effect
execute at @s run particle minecraft:block minecraft:stone ~ ~ ~ 2 0.1 2 1 100 normal
execute at @s run particle minecraft:block minecraft:dirt ~ ~ ~ 2 0.1 2 1 100 normal

# Schedule the ongoing silhouette effect function
schedule function gon_transformation:silhouette_effect 5t

# Apply status effects - increased duration to 90 seconds
effect give @s minecraft:strength 90 3 true
effect give @s minecraft:resistance 90 2 true
effect give @s minecraft:speed 90 1 true
effect give @s minecraft:jump_boost 90 2 true
effect give @s minecraft:regeneration 90 1 true
effect give @s minecraft:glowing 90 0 true
effect give @s minecraft:fire_resistance 90 0 true
effect give @s minecraft:night_vision 90 0 true

# Apply attribute modifiers - Enhanced for more power
attribute @s minecraft:generic.max_health modifier add d63797b4-14c6-4f33-86d0-395c41d9db1a "gon_transformation_health" 20.0 add
attribute @s minecraft:generic.attack_damage modifier add d63797b4-14c6-4f33-86d0-395c41d9db1b "gon_transformation_damage" 7.0 multiply
attribute @s minecraft:generic.armor modifier add d63797b4-14c6-4f33-86d0-395c41d9db1c "gon_transformation_armor" 12.0 add
attribute @s minecraft:generic.movement_speed modifier add d63797b4-14c6-4f33-86d0-395c41d9db1d "gon_transformation_speed" 0.4 multiply
attribute @s minecraft:generic.knockback_resistance modifier add d63797b4-14c6-4f33-86d0-395c41d9db1e "gon_transformation_knockback" 1.0 add

# Heal player to max health
effect give @s minecraft:instant_health 1 20 true

# Set transformed state and time (90 seconds = 1800 ticks)
scoreboard players set @s gon_transform 1
scoreboard players set @s gon_transform_time 1800

# Reset charging counter
scoreboard players set @s gon_transform_time_charge 0

# Screen effects
title @s times 10 40 20
title @s title {"text":"TRANSFORMED","color":"dark_red","bold":true,"obfuscated":true}
title @s subtitle {"text":"I don't care if this is the end...","color":"red","italic":true}
schedule function gon_transformation:title_clear 25t

# Creates a global shockwave effect
execute at @s as @a[distance=..32] at @s run playsound minecraft:entity.generic.explode player @s ~ ~ ~ 0.4 0.5
execute at @s as @a[distance=..32] run effect give @s minecraft:blindness 1 0 true
execute at @s as @a[distance=..32] at @s anchored eyes positioned ^ ^ ^ run particle minecraft:flash ~ ~ ~ 0 0 0 0 1 force

# Grant advancement
advancement grant @s only gon_transformation:transformation