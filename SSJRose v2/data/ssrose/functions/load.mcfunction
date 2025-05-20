# Create necessary scoreboard objectives
scoreboard objectives add ssrose.transformed dummy
scoreboard objectives add ssrose.cooldown dummy
scoreboard objectives add ssrose.trigger trigger
scoreboard objectives add ssrose.particles dummy
scoreboard objectives add ssrose.pillar_time dummy

# Setup teams for visual effects
team add ssrose
team modify ssrose color light_purple
team modify ssrose prefix {"text":"[SSR] ","color":"light_purple"}
team modify ssrose suffix {"text":" ","color":"light_purple"}

# Setup custom gamerules for this datapack
gamerule sendCommandFeedback false

# Display load message with stylish formatting
tellraw @a [{"text":"\n≫ ","color":"light_purple","bold":true},{"text":"Super Saiyan Rosé","color":"light_purple","bold":true},{"text":" datapack loaded!","color":"white","bold":false}]
tellraw @a [{"text":"   Use ","color":"white"},{"text":"/trigger ssrose.trigger","color":"light_purple","bold":true},{"text":" to transform!","color":"white"}]
tellraw @a [{"text":"   A divine transformation awaits...","color":"pink","italic":true},{"text":"\n","color":"white"}]

# Run setup function
function ssrose:setup

# Restore command feedback
schedule function ssrose:restore_feedback 1t