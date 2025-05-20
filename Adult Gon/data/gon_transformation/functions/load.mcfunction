# Setup scoreboard objectives
scoreboard objectives add gon_transform dummy
scoreboard objectives add gon_transform_time dummy
scoreboard objectives add gon_transform_time_charge dummy
scoreboard objectives add gon_cooldown dummy
scoreboard objectives add gon_trigger trigger

# Initialize trigger
scoreboard players enable @a gon_trigger

# Display load message
tellraw @a ["",{"text":"Gon's Transformation Datapack","color":"green","bold":true},{"text":" has been loaded!","color":"white"}]
tellraw @a ["",{"text":"Use ","color":"white"},{"text":"/trigger gon_trigger","color":"yellow"},{"text":" to get the transformation item","color":"white"}]
