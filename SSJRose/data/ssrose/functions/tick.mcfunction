# Re-enable trigger for all players
scoreboard players enable @a ssrose.trigger

# Process trigger
execute as @a[scores={ssrose.trigger=1..}] run function ssrose:transform
scoreboard players set @a[scores={ssrose.trigger=1..}] ssrose.trigger 0

# Process cooldowns
scoreboard players remove @a[scores={ssrose.cooldown=1..}] ssrose.cooldown 1

# Play particle effects for transformed players
execute as @a[scores={ssrose.transformed=1..}] at @s run function ssrose:particles