# Increment counter if not on cooldown (20 ticks = 1 second)
execute unless score @s gon_cooldown matches 1.. unless score @s gon_transform matches 1 run scoreboard players add @s gon_transform_time_charge 1

# Play charging sound effect
execute if score @s gon_transform_time_charge matches 1 run playsound minecraft:block.beacon.power_select player @a[distance=..16] ~ ~ ~ 1 0.7
execute if score @s gon_transform_time_charge matches 20 run playsound minecraft:block.beacon.power_select player @a[distance=..16] ~ ~ ~ 1 0.8
execute if score @s gon_transform_time_charge matches 40 run playsound minecraft:block.beacon.power_select player @a[distance=..16] ~ ~ ~ 1 0.9
execute if score @s gon_transform_time_charge matches 60 run playsound minecraft:block.beacon.power_select player @a[distance=..16] ~ ~ ~ 1 1.0
execute if score @s gon_transform_time_charge matches 80 run playsound minecraft:block.beacon.power_select player @a[distance=..16] ~ ~ ~ 1 1.1

# Show charging particles
execute if score @s gon_transform_time_charge matches 1..99 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.2 0.5 0.2 0.01 1
execute if score @s gon_transform_time_charge matches 1..99 run particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.1 0.1 0.05 1

# Show progress actionbar
execute if score @s gon_transform_time_charge matches 1..19 run title @s actionbar {"text":"Charging transformation [▌        ]","color":"dark_red"}
execute if score @s gon_transform_time_charge matches 20..39 run title @s actionbar {"text":"Charging transformation [▌▌      ]","color":"dark_red"}
execute if score @s gon_transform_time_charge matches 40..59 run title @s actionbar {"text":"Charging transformation [▌▌▌    ]","color":"dark_red"}
execute if score @s gon_transform_time_charge matches 60..79 run title @s actionbar {"text":"Charging transformation [▌▌▌▌  ]","color":"dark_red"}
execute if score @s gon_transform_time_charge matches 80..99 run title @s actionbar {"text":"Charging transformation [▌▌▌▌▌]","color":"dark_red"}

# If charged for 5 seconds (100 ticks), transform
execute if score @s gon_transform_time_charge matches 100.. run function gon_transformation:transform