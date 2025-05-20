# Display all status values in a user-friendly format
tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Player Status Summary","color":"aqua"}]
tellraw @s ["",{"text":"============================================","color":"gray"}]

# Display Player Stats
tellraw @s ["",{"text":"Player Level: ","color":"green"},{"score":{"name":"@s","objective":"PlayerLevel"},"color":"yellow"}]
tellraw @s ["",{"text":"Fame: ","color":"green"},{"score":{"name":"@s","objective":"Fame"},"color":"yellow"}]

# Display Grade
execute if score @s Grade matches 0 run tellraw @s ["",{"text":"Sorcerer Grade: ","color":"light_purple"},{"text":"Not a Sorcerer","color":"white"}]
execute if score @s Grade matches 1 run tellraw @s ["",{"text":"Sorcerer Grade: ","color":"light_purple"},{"text":"Grade 4","color":"white"}]
execute if score @s Grade matches 2 run tellraw @s ["",{"text":"Sorcerer Grade: ","color":"light_purple"},{"text":"Grade 3","color":"white"}]
execute if score @s Grade matches 3 run tellraw @s ["",{"text":"Sorcerer Grade: ","color":"light_purple"},{"text":"Semi-Grade 2","color":"white"}]
execute if score @s Grade matches 4 run tellraw @s ["",{"text":"Sorcerer Grade: ","color":"light_purple"},{"text":"Grade 2","color":"white"}]
execute if score @s Grade matches 5 run tellraw @s ["",{"text":"Sorcerer Grade: ","color":"light_purple"},{"text":"Semi-Grade 1","color":"white"}]
execute if score @s Grade matches 6 run tellraw @s ["",{"text":"Sorcerer Grade: ","color":"light_purple"},{"text":"Grade 1","color":"white"}]
execute if score @s Grade matches 7 run tellraw @s ["",{"text":"Sorcerer Grade: ","color":"light_purple"},{"text":"Special Grade","color":"white"}]

# Display Curse Techniques
tellraw @s ["",{"text":"Primary CT: ","color":"aqua"},{"score":{"name":"@s","objective":"CurrentCT"},"color":"yellow"}]
tellraw @s ["",{"text":"Secondary CT: ","color":"aqua"},{"score":{"name":"@s","objective":"SecondCT"},"color":"yellow"}]

# Display Special Status
execute if score @s SixEyes matches 1 run tellraw @s ["",{"text":"Six Eyes: ","color":"blue"},{"text":"ACTIVE ✓","color":"green","bold":true}]
execute if score @s IsSukuna matches 1 run tellraw @s ["",{"text":"Sukuna: ","color":"red"},{"text":"ACTIVE ✓","color":"green","bold":true}]
execute if score @s SixEyes matches 0 run tellraw @s ["",{"text":"Six Eyes: ","color":"blue"},{"text":"INACTIVE ✗","color":"red","bold":true}]
execute if score @s IsSukuna matches 0 run tellraw @s ["",{"text":"Sukuna: ","color":"red"},{"text":"INACTIVE ✗","color":"red","bold":true}]
execute if score @s RctUnlocked matches 1.. run tellraw @s ["",{"text":"RCT Level: ","color":"gold"},{"score":{"name":"@s","objective":"RctUnlocked"},"color":"yellow"}]

# Display Special Items
tellraw @s ["",{"text":"Sukuna Fingers: ","color":"red"},{"score":{"name":"@s","objective":"SukunaFingers"},"color":"yellow"},{"text":"/20","color":"gray"}]
tellraw @s ["",{"text":"Death Paintings: ","color":"dark_aqua"},{"score":{"name":"@s","objective":"DeathPaintings"},"color":"yellow"},{"text":"/9","color":"gray"}]

tellraw @s ["",{"text":"============================================","color":"gray"}]
