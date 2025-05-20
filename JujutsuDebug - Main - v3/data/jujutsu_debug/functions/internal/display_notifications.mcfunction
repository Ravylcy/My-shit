# Display notifications when scores change
# Only show notifications if significant changes occurred to avoid spam

# CT changes
execute unless score @s CurrentCT = @s PrevCT run tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Your Primary Curse Technique changed to ","color":"yellow"},{"score":{"name":"@s","objective":"CurrentCT"},"color":"aqua"}]

execute unless score @s SecondCT = @s PrevSecondCT run tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Your Secondary Curse Technique changed to ","color":"yellow"},{"score":{"name":"@s","objective":"SecondCT"},"color":"aqua"}]

# Level up
execute if score @s PlayerLevel > @s PrevLevel run tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Level Up! ","color":"green"},{"score":{"name":"@s","objective":"PrevLevel"},"color":"yellow"},{"text":" → ","color":"gray"},{"score":{"name":"@s","objective":"PlayerLevel"},"color":"yellow"}]

# Fame change
execute if score @s Fame > @s PrevFame run tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Fame increased: ","color":"light_purple"},{"score":{"name":"@s","objective":"PrevFame"},"color":"yellow"},{"text":" → ","color":"gray"},{"score":{"name":"@s","objective":"Fame"},"color":"yellow"}]

# Grade change
execute unless score @s Grade = @s PrevGrade run function jujutsu_debug:internal/notify_grade_change

# RCT unlock
execute if score @s RctUnlocked > @s PrevRctUnlocked run tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"RCT Level Unlocked: ","color":"aqua"},{"score":{"name":"@s","objective":"RctUnlocked"},"color":"yellow"}]

# Finger changes
execute if score @s SukunaFingers > @s PrevFingers run tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Sukuna Finger consumed! ","color":"red"},{"score":{"name":"@s","objective":"SukunaFingers"},"color":"yellow"},{"text":"/20","color":"gray"}]

# Death Painting changes
execute if score @s DeathPaintings > @s PrevPaintings run tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"Death Painting consumed! ","color":"dark_aqua"},{"score":{"name":"@s","objective":"DeathPaintings"},"color":"yellow"},{"text":"/9","color":"gray"}]