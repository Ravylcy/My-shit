# Set cooldown for the sealer
scoreboard players operation @a[tag=sealer,limit=1] pr_cooldown = #cooldown_time pr_cooldown

# Check if target is already sealed
execute if entity @e[tag=target,scores={pr_sealed=1..}] run tellraw @a[tag=sealer] {"text":"This player is already sealed!","color":"red"}
execute if entity @e[tag=target,scores={pr_sealed=1..}] run return 0

# Seal the player
scoreboard players set @e[tag=target] pr_sealed 1
team join sealed @e[tag=target]

# Teleport to the prison realm
tp @e[tag=target] @e[type=armor_stand,tag=prison_realm_center,limit=1]

# Effects and sounds
execute at @e[tag=target] run particle minecraft:portal ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @e[tag=target] run particle minecraft:witch ~ ~1 ~ 0.5 1 0.5 0.5 50 force
execute at @e[tag=sealer] run playsound minecraft:block.enchantment_table.use player @a ~ ~ ~ 1 0.5
execute at @e[tag=sealer] run playsound minecraft:entity.enderman.teleport player @a ~ ~ ~ 1 0.7

# Broadcast message
tellraw @a [{"selector":"@e[tag=target]","color":"dark_purple"},{"text":" has been sealed in the Prison Realm by ","color":"light_purple"},{"selector":"@a[tag=sealer]","color":"dark_purple"}]
