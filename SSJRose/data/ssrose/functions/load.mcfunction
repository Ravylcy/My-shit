# Create necessary scoreboard objectives
scoreboard objectives add ssrose.transformed dummy
scoreboard objectives add ssrose.cooldown dummy
scoreboard objectives add ssrose.trigger trigger

# Setup teams for visual effects
team add ssrose
team modify ssrose color light_purple
team modify ssrose prefix {"text":"[SSR] ","color":"light_purple"}

# Initialize visual effects scoreboard
scoreboard objectives add ssrose.particles dummy

# Display load message
tellraw @a [{"text":"Super Saiyan Rosé","color":"light_purple","bold":true},{"text":" datapack loaded!","color":"white","bold":false}]
tellraw @a [{"text":"Use ","color":"white"},{"text":"/trigger ssrose.trigger","color":"light_purple"},{"text":" to transform!","color":"white"}]

# Run setup function
function ssrose:setup