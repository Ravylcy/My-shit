# Reset all debug data for the executing player and mob scores

tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Resetting all debug data...","color":"yellow"}]

# Reset all player scores
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

# Reset mob scores for nearest entity (optional)
execute as @e[type=!player,limit=1,sort=nearest] run scoreboard players reset @s MobSkill
execute as @e[type=!player,limit=1,sort=nearest] run scoreboard players reset @s MobChargeLevel
execute as @e[type=!player,limit=1,sort=nearest] run scoreboard players reset @s MobRct
execute as @e[type=!player,limit=1,sort=nearest] run scoreboard players reset @s MobRctAmplifier
execute as @e[type=!player,limit=1,sort=nearest] run scoreboard players reset @s MobZone
execute as @e[type=!player,limit=1,sort=nearest] run scoreboard players reset @s MobZoneAmplifier
execute as @e[type=!player,limit=1,sort=nearest] run scoreboard players reset @s MobDomainExpansion

tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Debug data reset complete!","color":"green"}]