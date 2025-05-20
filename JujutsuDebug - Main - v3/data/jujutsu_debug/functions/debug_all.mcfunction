# Run all debug command functions
tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Running all checks...","color":"yellow"}]

# Add a separator for readability
tellraw @s ["",{"text":"==============================================","color":"gray"}]

# Run each check with a small delay between them
function jujutsu_debug:check_sukuna
tellraw @s ["",{"text":"==============================================","color":"gray"}]

function jujutsu_debug:check_six_eyes
tellraw @s ["",{"text":"==============================================","color":"gray"}]

function jujutsu_debug:check_curse_techniques
tellraw @s ["",{"text":"==============================================","color":"gray"}]

function jujutsu_debug:check_stats
tellraw @s ["",{"text":"==============================================","color":"gray"}]

function jujutsu_debug:check_effects
tellraw @s ["",{"text":"==============================================","color":"gray"}]

function jujutsu_debug:check_advancements
tellraw @s ["",{"text":"==============================================","color":"gray"}]

function jujutsu_debug:check_special_items
tellraw @s ["",{"text":"==============================================","color":"gray"}]

function jujutsu_debug:check_skills
tellraw @s ["",{"text":"==============================================","color":"gray"}]

function jujutsu_debug:check_charge
tellraw @s ["",{"text":"==============================================","color":"gray"}]

function jujutsu_debug:check_curse_power
tellraw @s ["",{"text":"==============================================","color":"gray"}]

function jujutsu_debug:check_status

# Final message
tellraw @s ["",{"text":"==============================================","color":"gray"}]
tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"All checks completed!","color":"green"}]