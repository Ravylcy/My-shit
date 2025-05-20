# Only operators can unseal players
execute unless entity @s[type=player] run return 0

# Remove sealed status
scoreboard players set @s pr_sealed 0
team leave @s

# Effects and sounds
execute at @s run particle minecraft:reverse_portal ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:block.beacon.activate player @a ~ ~ ~ 1 1.5

# Broadcast message
tellraw @a [{"selector":"@s","color":"dark_purple"},{"text":" has been released from the Prison Realm!","color":"light_purple"}]

# Teleport to world spawn (can be changed to any other location)
execute in minecraft:overworld run tp @s 0 100 0