# Initialize tick system
scoreboard objectives add jc_debug_init dummy
scoreboard players set #tick_init jc_debug_init 1

# Create tracking scoreboards if they don't exist
function jujutsu_debug:setup

# Create additional tracking scoreboards
scoreboard objectives add PrevCT dummy "Previous CT"
scoreboard objectives add PrevSecondCT dummy "Previous Secondary CT"
scoreboard objectives add PrevFame dummy "Previous Fame"
scoreboard objectives add PrevLevel dummy "Previous Level"
scoreboard objectives add PrevGrade dummy "Previous Grade"
scoreboard objectives add PrevRctUnlocked dummy "Previous RCT Level"
scoreboard objectives add ScoreChanged dummy "Score Changed"

# Set up tick counter for timed notifications
scoreboard objectives add TickCounter dummy
scoreboard players set #global TickCounter 0

tellraw @a ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Tick system initialized!","color":"green"}]