# Scoreboards initialization
scoreboard objectives add pr_sealed dummy
scoreboard objectives add pr_use minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add pr_permission dummy
scoreboard objectives add pr_cooldown dummy

# Create a team for sealed players to prevent them from escaping
team add sealed
team modify sealed color dark_purple
team modify sealed prefix {"text":"[Sealed] ","color":"dark_purple"}
team modify sealed seeFriendlyInvisibles false

# Define constants
scoreboard players set #cooldown_time pr_cooldown 600

# Display load message
tellraw @a {"text":"Prison Realm Datapack loaded successfully","color":"dark_purple"}
tellraw @a {"text":"By the power of Gojo Satoru, you can now seal players!","color":"light_purple","italic":true}

# Create the prison realm location - feel free to change these coordinates
execute unless entity @e[type=armor_stand,tag=prison_realm_center] run summon armor_stand 0 100 0 {NoGravity:1b,Invisible:1b,Invulnerable:1b,Tags:["prison_realm_center"],CustomName:'{"text":"Prison Realm Center"}'}
