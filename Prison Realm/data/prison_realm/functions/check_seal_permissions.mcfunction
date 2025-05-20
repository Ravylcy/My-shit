# Check if player has permission to seal others
execute if score @s pr_permission matches 1.. if score @s pr_cooldown matches 0 run function prison_realm:attempt_seal
execute if score @s pr_permission matches 1.. if score @s pr_cooldown matches 1.. run tellraw @s {"text":"The Prison Realm is still recharging...","color":"red"}
execute unless score @s pr_permission matches 1.. run tellraw @s {"text":"You don't possess enough cursed energy to use this technique!","color":"red"}