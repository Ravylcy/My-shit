# Reset grade and RCT unlock scores
scoreboard players set @s Grade 0
scoreboard players set @s RctUnlocked 0

# Check for sorcerer grade advancements
execute if entity @s[advancements={jujutsucraft:sorcerer_grade_4=true}] run scoreboard players set @s Grade 1
execute if entity @s[advancements={jujutsucraft:sorcerer_grade_3=true}] run scoreboard players set @s Grade 2
execute if entity @s[advancements={jujutsucraft:sorcerer_grade_2_semi=true}] run scoreboard players set @s Grade 3
execute if entity @s[advancements={jujutsucraft:sorcerer_grade_2=true}] run scoreboard players set @s Grade 4
execute if entity @s[advancements={jujutsucraft:sorcerer_grade_1_semi=true}] run scoreboard players set @s Grade 5
execute if entity @s[advancements={jujutsucraft:sorcerer_grade_1=true}] run scoreboard players set @s Grade 6
execute if entity @s[advancements={jujutsucraft:sorcerer_grade_special=true}] run scoreboard players set @s Grade 7

# Check RCT unlocks
execute if entity @s[advancements={jujutsucraft:reverse_cursed_technique_1=true}] run scoreboard players set @s RctUnlocked 1
execute if entity @s[advancements={jujutsucraft:reverse_cursed_technique_2=true}] run scoreboard players set @s RctUnlocked 2

# Display results
tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Advancement Status","color":"dark_aqua"}]
tellraw @s ["",{"text":"Sorcerer Grade: ","color":"gray"},{"score":{"name":"@s","objective":"Grade"},"color":"yellow"}]
tellraw @s ["",{"text":"RCT Unlocked Level: ","color":"gray"},{"score":{"name":"@s","objective":"RctUnlocked"},"color":"yellow"}]

# Display grade translation
execute if score @s Grade matches 0 run tellraw @s ["",{"text":"Grade Translation: ","color":"gray"},{"text":"Not a Sorcerer","color":"white"}]
execute if score @s Grade matches 1 run tellraw @s ["",{"text":"Grade Translation: ","color":"gray"},{"text":"Grade 4","color":"white"}]
execute if score @s Grade matches 2 run tellraw @s ["",{"text":"Grade Translation: ","color":"gray"},{"text":"Grade 3","color":"white"}]
execute if score @s Grade matches 3 run tellraw @s ["",{"text":"Grade Translation: ","color":"gray"},{"text":"Semi-Grade 2","color":"white"}]
execute if score @s Grade matches 4 run tellraw @s ["",{"text":"Grade Translation: ","color":"gray"},{"text":"Grade 2","color":"white"}]
execute if score @s Grade matches 5 run tellraw @s ["",{"text":"Grade Translation: ","color":"gray"},{"text":"Semi-Grade 1","color":"white"}]
execute if score @s Grade matches 6 run tellraw @s ["",{"text":"Grade Translation: ","color":"gray"},{"text":"Grade 1","color":"white"}]
execute if score @s Grade matches 7 run tellraw @s ["",{"text":"Grade Translation: ","color":"gray"},{"text":"Special Grade","color":"white"}]