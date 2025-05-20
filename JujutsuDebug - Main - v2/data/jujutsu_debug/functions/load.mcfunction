# Modified portion of load.mcfunction
# Add automatic setup option

tellraw @a ["",{"text":"JujutsuCraft Debug","color":"gold","bold":true},{"text":" Datapack loaded!","color":"yellow"}]
tellraw @a ["",{"text":"Setting up required scoreboards...","color":"gray"}]
function jujutsu_debug:setup
tellraw @a ["",{"text":"Use ","color":"gray"},{"text":"/function jujutsu_debug:debug_all","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function jujutsu_debug:debug_all"}},{"text":" to check all values","color":"gray"}]
tellraw @a ["",{"text":"Use ","color":"gray"},{"text":"/function jujutsu_debug:reset","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function jujutsu_debug:reset"}},{"text":" to reset debug data","color":"gray"}]