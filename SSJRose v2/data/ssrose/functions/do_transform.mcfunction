# Set transformation status
scoreboard players set @s ssrose.transformed 1

# Add player to team for visual effect
team join ssrose @s

# Apply attribute modifiers
attribute @s minecraft:generic.max_health modifier add 5555-1-1-1-1 "ssrose.health" 0.5 multiply
attribute @s minecraft:generic.movement_speed modifier add 5555-1-1-1-2 "ssrose.speed" 0.4 multiply
attribute @s minecraft:generic.attack_damage modifier add 5555-1-1-1-3 "ssrose.damage" 0.7 multiply
attribute @s minecraft:generic.attack_speed modifier add 5555-1-1-1-4 "ssrose.attack_speed" 0.3 multiply
attribute @s minecraft:generic.knockback_resistance modifier add 5555-1-1-1-5 "ssrose.knockback" 0.5 add

# Initial sound effects - divine transformation
playsound minecraft:entity.wither.spawn player @a ~ ~ ~ 1 1.5
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 0.8 0.5
playsound minecraft:block.beacon.activate player @a ~ ~ ~ 1 0.7
playsound minecraft:block.end_portal.spawn player @a ~ ~ ~ 0.4 1.2

# Create divine energy pillar effect
execute at @s run summon armor_stand ~ ~ ~ {Tags:["ssrose.pillar"],Invisible:1b,Marker:1b,NoGravity:1b}

# Initial particle burst (representing the explosion of divine ki)
# Pink aura core
particle minecraft:dust 1.0 0.4 0.7 1.5 ~ ~1 ~ 0.5 1 0.5 0.1 80
# Black energy mixed with pink
particle minecraft:dust 0.2 0.0 0.1 1.3 ~ ~1 ~ 0.5 1 0.5 0.1 60
# Divine energy particles
particle minecraft:end_rod ~ ~1 ~ 1 1 1 0.2 60
# Dramatic flash effect
particle minecraft:flash ~ ~1 ~ 0 0 0 0 8
# Energy explosion effect
particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1

# Create rising energy pillar effect (executed by armor stand)
execute as @e[type=armor_stand,tag=ssrose.pillar,limit=1,sort=nearest] at @s run function ssrose:pillar_effect

# Give glowing effect
effect give @s minecraft:glowing 999999 0 true

# Dramatic screen shake effect
execute as @a[distance=..30] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Duration:1,Effects:[{Id:9,Amplifier:3b,Duration:10,ShowParticles:0b}]}

# Grant advancement
advancement grant @s only ssrose:transform_advancement

# Visual feedback
title @s title {"text":"Super Saiyan Rosé","color":"light_purple","bold":true}
title @s subtitle {"text":"Divine Transformation Complete!","color":"pink"}
tellraw @a [{"selector":"@s","color":"light_purple"},{"text":" has transformed into ","color":"white"},{"text":"Super Saiyan Rosé","color":"light_purple","bold":true},{"text":"!","color":"white"}]

# Add slow motion effect briefly for dramatic effect
effect give @a[distance=..30] minecraft:slowness 2 0 true