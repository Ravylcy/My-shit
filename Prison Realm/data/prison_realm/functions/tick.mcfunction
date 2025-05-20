# Check for players using the prison realm scroll (carrot on a stick with custom model data)
execute as @a[scores={pr_use=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:960123,PrisonRealm:1b}}}] at @s run function prison_realm:check_seal_permissions

# Reset usage score
scoreboard players reset @a[scores={pr_use=1..}] pr_use

# Apply effects to sealed players
execute as @a[scores={pr_sealed=1}] run function prison_realm:seal_effects

# Decrease cooldown timer
scoreboard players remove @a[scores={pr_cooldown=1..}] pr_cooldown 1