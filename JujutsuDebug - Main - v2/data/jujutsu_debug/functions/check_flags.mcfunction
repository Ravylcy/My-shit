# Modified check_flags.mcfunction that directly checks effect status rather than relying on scoreboard values

tellraw @s ["",{"text":"JujutsuCraft Debug: ","color":"gold"},{"text":"FLAG STATUS","color":"aqua","bold":true}]
tellraw @s ["",{"text":"============================================","color":"gray"}]

# Check Six Eyes flag from the stored scoreboard value
execute if score @s SixEyes matches 1 run tellraw @s ["",{"text":"Six Eyes: ","color":"aqua"},{"text":"ACTIVE ✓","color":"green","bold":true}]
execute if score @s SixEyes matches 0 run tellraw @s ["",{"text":"Six Eyes: ","color":"aqua"},{"text":"INACTIVE ✗","color":"red"}]

# Check Sukuna flag from the stored scoreboard value
execute if score @s IsSukuna matches 1 run tellraw @s ["",{"text":"Sukuna: ","color":"dark_red"},{"text":"ACTIVE ✓","color":"green","bold":true}]
execute if score @s IsSukuna matches 0 run tellraw @s ["",{"text":"Sukuna: ","color":"dark_red"},{"text":"INACTIVE ✗","color":"red"}]

# Check Domain Expansion effect directly rather than using scoreboard value
execute if entity @s[nbt={ActiveEffects:[{Id:65}]}] run tellraw @s ["",{"text":"Domain Expansion: ","color":"light_purple"},{"text":"ACTIVE ✓","color":"green","bold":true}]
execute unless entity @s[nbt={ActiveEffects:[{Id:65}]}] run tellraw @s ["",{"text":"Domain Expansion: ","color":"light_purple"},{"text":"INACTIVE ✗","color":"red"}]

# Check RCT effect directly rather than using scoreboard value
execute if entity @s[nbt={ActiveEffects:[{Id:79}]}] run tellraw @s ["",{"text":"RCT: ","color":"green"},{"text":"ACTIVE ✓","color":"green","bold":true}]
execute unless entity @s[nbt={ActiveEffects:[{Id:79}]}] run tellraw @s ["",{"text":"RCT: ","color":"green"},{"text":"INACTIVE ✗","color":"red"}]

# Check Zone effect directly rather than using scoreboard value
execute if entity @s[nbt={ActiveEffects:[{Id:68}]}] run tellraw @s ["",{"text":"Zone: ","color":"yellow"},{"text":"ACTIVE ✓","color":"green","bold":true}]
execute unless entity @s[nbt={ActiveEffects:[{Id:68}]}] run tellraw @s ["",{"text":"Zone: ","color":"yellow"},{"text":"INACTIVE ✗","color":"red"}]

tellraw @s ["",{"text":"============================================","color":"gray"}]