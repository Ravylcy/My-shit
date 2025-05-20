# v2/data/jujutsu_debug/functions/reset_all_mob_scores.mcfunction
# Reset all mob debug scores for all entities

tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Resetting all mob scores...","color":"yellow"}]

# Reset all mob scores
scoreboard players reset @e[type=!player] MobSkill
scoreboard players reset @e[type=!player] MobChargeLevel
scoreboard players reset @e[type=!player] MobRct
scoreboard players reset @e[type=!player] MobRctAmplifier
scoreboard players reset @e[type=!player] MobZone
scoreboard players reset @e[type=!player] MobZoneAmplifier
scoreboard players reset @e[type=!player] MobDomainExpansion

tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Mob scores reset complete!","color":"green"}]