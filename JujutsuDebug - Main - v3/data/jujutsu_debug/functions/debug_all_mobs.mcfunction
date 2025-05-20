# Run all mob debug functions (use with caution on many entities)
tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Running all mob checks...","color":"yellow"}]
tellraw @s ["",{"text":"Target: ","color":"gray"},{"selector":"@e[limit=1,sort=nearest,type=!player]","color":"yellow"}]

# Add a separator for readability
tellraw @s ["",{"text":"==============================================","color":"gray"}]

# Run each check on the nearest non-player entity
execute as @e[limit=1,sort=nearest,type=!player] run function jujutsu_debug:check_mob_skills
tellraw @s ["",{"text":"==============================================","color":"gray"}]

execute as @e[limit=1,sort=nearest,type=!player] run function jujutsu_debug:check_mob_charge
tellraw @s ["",{"text":"==============================================","color":"gray"}]

execute as @e[limit=1,sort=nearest,type=!player] run function jujutsu_debug:check_mob_effects

# Final message
tellraw @s ["",{"text":"==============================================","color":"gray"}]
tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"All mob checks completed!","color":"green"}]