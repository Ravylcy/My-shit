# This is the enhanced check_transformation.mcfunction

# Increment counter if not on cooldown (20 ticks = 1 second)
execute unless score @s gon_cooldown matches 1.. unless score @s gon_transform matches 1 run scoreboard players add @s gon_transform_time_charge 1

# Play enhanced charging sound effects with increasing intensity
execute if score @s gon_transform_time_charge matches 1 run playsound minecraft:block.beacon.power_select player @a[distance=..24] ~ ~ ~ 1 0.5
execute if score @s gon_transform_time_charge matches 20 run playsound minecraft:block.beacon.power_select player @a[distance=..24] ~ ~ ~ 1.1 0.6
execute if score @s gon_transform_time_charge matches 40 run playsound minecraft:block.beacon.power_select player @a[distance=..24] ~ ~ ~ 1.2 0.7
execute if score @s gon_transform_time_charge matches 60 run playsound minecraft:block.beacon.power_select player @a[distance=..24] ~ ~ ~ 1.3 0.8
execute if score @s gon_transform_time_charge matches 80 run playsound minecraft:block.beacon.power_select player @a[distance=..24] ~ ~ ~ 1.4 0.9
execute if score @s gon_transform_time_charge matches 80 run playsound minecraft:entity.warden.heartbeat player @a[distance=..24] ~ ~ ~ 0.7 0.5

# Show enhanced charging particles - gradually building in intensity
execute if score @s gon_transform_time_charge matches 1..20 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.2 0.5 0.2 0.01 1
execute if score @s gon_transform_time_charge matches 21..40 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.6 0.3 0.01 2
execute if score @s gon_transform_time_charge matches 41..60 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.4 0.7 0.4 0.02 3
execute if score @s gon_transform_time_charge matches 61..80 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.5 0.8 0.5 0.03 4
execute if score @s gon_transform_time_charge matches 81..99 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.6 0.9 0.6 0.04 5

# Add dark red aura particles (increasing in intensity)
execute if score @s gon_transform_time_charge matches 40..60 run particle minecraft:dust 0.6 0.0 0.0 1.0 ~ ~1 ~ 0.3 0.6 0.3 0 2
execute if score @s gon_transform_time_charge matches 61..80 run particle minecraft:dust 0.6 0.0 0.0 1.2 ~ ~1 ~ 0.4 0.7 0.4 0 3
execute if score @s gon_transform_time_charge matches 81..99 run particle minecraft:dust 0.6 0.0 0.0 1.5 ~ ~1 ~ 0.5 0.8 0.5 0 4

# Add black energy particles (increasing in intensity)
execute if score @s gon_transform_time_charge matches 60..80 run particle minecraft:smoke ~ ~1 ~ 0.3 0.6 0.3 0.01 2
execute if score @s gon_transform_time_charge matches 81..99 run particle minecraft:smoke ~ ~1 ~ 0.4 0.7 0.4 0.02 3

# Ground cracking effect as power builds
execute if score @s gon_transform_time_charge matches 80..99 run particle minecraft:block minecraft:stone ~ ~0.1 ~ 0.7 0.1 0.7 1 5

# Show progress actionbar with anime-style text
execute if score @s gon_transform_time_charge matches 1..19 run title @s actionbar {"text":"Unleashing power [▌        ]","color":"dark_red","bold":true}
execute if score @s gon_transform_time_charge matches 20..39 run title @s actionbar {"text":"Unleashing power [▌▌      ]","color":"dark_red","bold":true}
execute if score @s gon_transform_time_charge matches 40..59 run title @s actionbar {"text":"Unleashing power [▌▌▌    ]","color":"dark_red","bold":true}
execute if score @s gon_transform_time_charge matches 60..79 run title @s actionbar {"text":"Unleashing power [▌▌▌▌  ]","color":"dark_red","bold":true}
execute if score @s gon_transform_time_charge matches 80..99 run title @s actionbar {"text":"Unleashing power [▌▌▌▌▌]","color":"dark_red","bold":true}

# If charged for 5 seconds (100 ticks), transform
execute if score @s gon_transform_time_charge matches 100.. run function gon_transformation:transform