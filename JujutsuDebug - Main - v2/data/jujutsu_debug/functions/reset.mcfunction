# Reset all debug data for the executing player

tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Resetting all debug data...","color":"yellow"}]

# Reset all scores
scoreboard players reset @s IsSukuna
scoreboard players reset @s SixEyes
scoreboard players reset @s CurrentCT
scoreboard players reset @s SecondCT
scoreboard players reset @s Fame
scoreboard players reset @s PlayerLevel
scoreboard players reset @s SukunaAmplifier
scoreboard players reset @s SixEyesAmplifier
scoreboard players reset @s Rct
scoreboard players reset @s RctAmplifier
scoreboard players reset @s Zone
scoreboard players reset @s ZoneAmplifier
scoreboard players reset @s DomainExpansion
scoreboard players reset @s Grade
scoreboard players reset @s RctUnlocked
scoreboard players reset @s SukunaFingers
scoreboard players reset @s DeathPaintings
scoreboard players reset @s PrevFingers
scoreboard players reset @s PrevPaintings
scoreboard players reset @s PlayerSkill
scoreboard players reset @s ChargeLevel
scoreboard players reset @s CursePower

# Reset previous scores tracking
function jujutsu_debug:internal/reset_internal

tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Debug data reset complete!","color":"green"}]