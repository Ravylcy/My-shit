# Show grade change notifications with translated grade names

# Store old and new grades for comparison
scoreboard players operation #old_grade Grade = @s PrevGrade
scoreboard players operation #new_grade Grade = @s Grade

# Display grade change message
tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Grade Changed! ","color":"aqua"}]

# Display old grade
execute if score #old_grade Grade matches 0 run tellraw @s ["",{"text":"From: ","color":"gray"},{"text":"Not a Sorcerer","color":"white"}]
execute if score #old_grade Grade matches 1 run tellraw @s ["",{"text":"From: ","color":"gray"},{"text":"Grade 4","color":"white"}]
execute if score #old_grade Grade matches 2 run tellraw @s ["",{"text":"From: ","color":"gray"},{"text":"Grade 3","color":"white"}]
execute if score #old_grade Grade matches 3 run tellraw @s ["",{"text":"From: ","color":"gray"},{"text":"Semi-Grade 2","color":"white"}]
execute if score #old_grade Grade matches 4 run tellraw @s ["",{"text":"From: ","color":"gray"},{"text":"Grade 2","color":"white"}]
execute if score #old_grade Grade matches 5 run tellraw @s ["",{"text":"From: ","color":"gray"},{"text":"Semi-Grade 1","color":"white"}]
execute if score #old_grade Grade matches 6 run tellraw @s ["",{"text":"From: ","color":"gray"},{"text":"Grade 1","color":"white"}]
execute if score #old_grade Grade matches 7 run tellraw @s ["",{"text":"From: ","color":"gray"},{"text":"Special Grade","color":"white"}]

# Display new grade
execute if score #new_grade Grade matches 0 run tellraw @s ["",{"text":"To: ","color":"gray"},{"text":"Not a Sorcerer","color":"yellow"}]
execute if score #new_grade Grade matches 1 run tellraw @s ["",{"text":"To: ","color":"gray"},{"text":"Grade 4","color":"yellow"}]
execute if score #new_grade Grade matches 2 run tellraw @s ["",{"text":"To: ","color":"gray"},{"text":"Grade 3","color":"yellow"}]
execute if score #new_grade Grade matches 3 run tellraw @s ["",{"text":"To: ","color":"gray"},{"text":"Semi-Grade 2","color":"yellow"}]
execute if score #new_grade Grade matches 4 run tellraw @s ["",{"text":"To: ","color":"gray"},{"text":"Grade 2","color":"yellow"}]
execute if score #new_grade Grade matches 5 run tellraw @s ["",{"text":"To: ","color":"gray"},{"text":"Semi-Grade 1","color":"yellow"}]
execute if score #new_grade Grade matches 6 run tellraw @s ["",{"text":"To: ","color":"gray"},{"text":"Grade 1","color":"yellow"}]
execute if score #new_grade Grade matches 7 run tellraw @s ["",{"text":"To: ","color":"gray"},{"text":"Special Grade","color":"yellow"}]