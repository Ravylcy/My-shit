# Play transformation sound and effects
playsound minecraft:entity.wither.spawn player @a[distance=..32] ~ ~ ~ 1 1
playsound minecraft:entity.lightning_bolt.thunder player @a[distance=..32] ~ ~ ~ 1 0.5
playsound minecraft:block.respawn_anchor.deplete player @a[distance=..32] ~ ~ ~ 1 0.5

# Create dramatic effect
particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 1 1 force
particle minecraft:soul_fire_flame ~ ~1 ~ 0 0 0 0.5 100 force
particle minecraft:end_rod ~ ~1 ~ 0 0 0 0.5 100 force
particle minecraft:large_smoke ~ ~1 ~ 0.5 1 0.5 0.1 100 force

# Apply status effects
effect give @s minecraft:strength 60 2 true
effect give @s minecraft:resistance 60 1 true
effect give @s minecraft:speed 60 1 true
effect give @s minecraft:jump_boost 60 1 true
effect give @s minecraft:regeneration 60 1 true
effect give @s minecraft:glowing 60 0 true

# Apply attribute modifiers
attribute @s minecraft:generic.max_health modifier add d63797b4-14c6-4f33-86d0-395c41d9db1a "gon_transformation_health" 10.0 add
attribute @s minecraft:generic.attack_damage modifier add d63797b4-14c6-4f33-86d0-395c41d9db1b "gon_transformation_damage" 5.0 multiply_base
attribute @s minecraft:generic.armor modifier add d63797b4-14c6-4f33-86d0-395c41d9db1c "gon_transformation_armor" 8.0 add
attribute @s minecraft:generic.movement_speed modifier add d63797b4-14c6-4f33-86d0-395c41d9db1d "gon_transformation_speed" 0.3 multiply_base
attribute @s minecraft:generic.knockback_resistance modifier add d63797b4-14c6-4f33-86d0-395c41d9db1e "gon_transformation_knockback" 0.8 add

# Heal player to max health
effect give @s minecraft:instant_health 1 10 true

# Set transformed state and time (60 seconds = 1200 ticks)
scoreboard players set @s gon_transform 1
scoreboard players set @s gon_transform_time 1200

# Reset charging counter
scoreboard players set @s gon_transform_time_charge 0

# Display transformation message
title @s title {"text":"TRANSFORMED","color":"dark_red","bold":true}
title @s subtitle {"text":"Covenant activated - 60 seconds","color":"gray"}

# Grant advancement
advancement grant @s only gon_transformation:transformation