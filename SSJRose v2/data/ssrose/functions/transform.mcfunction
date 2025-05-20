# Check if player is already transformed or on cooldown
execute if score @s ssrose.transformed matches 1.. run function ssrose:untransform
execute if score @s ssrose.cooldown matches 1.. run tellraw @s [{"text":"Transformation is on cooldown!","color":"red"}]

# Transform if not on cooldown
execute unless score @s ssrose.transformed matches 1.. unless score @s ssrose.cooldown matches 1.. run function ssrose:do_transform

# Reset trigger
scoreboard players set @s ssrose.trigger 0