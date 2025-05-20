# Track changes in player scores

# First-time init for new players (if they don't have previous scores)
execute unless score @s PrevCT = @s PrevCT run scoreboard players operation @s PrevCT = @s CurrentCT
execute unless score @s PrevSecondCT = @s PrevSecondCT run scoreboard players operation @s PrevSecondCT = @s SecondCT
execute unless score @s PrevFame = @s PrevFame run scoreboard players operation @s PrevFame = @s Fame
execute unless score @s PrevLevel = @s PrevLevel run scoreboard players operation @s PrevLevel = @s PlayerLevel
execute unless score @s PrevGrade = @s PrevGrade run scoreboard players operation @s PrevGrade = @s Grade
execute unless score @s PrevRctUnlocked = @s PrevRctUnlocked run scoreboard players operation @s PrevRctUnlocked = @s RctUnlocked
execute unless score @s PrevFingers = @s PrevFingers run scoreboard players operation @s PrevFingers = @s SukunaFingers
execute unless score @s PrevPaintings = @s PrevPaintings run scoreboard players operation @s PrevPaintings = @s DeathPaintings


# Check for changes
scoreboard players set @s ScoreChanged 0

# Check if any scores have changed
execute unless score @s CurrentCT = @s PrevCT run scoreboard players set @s ScoreChanged 1
execute unless score @s SecondCT = @s PrevSecondCT run scoreboard players set @s ScoreChanged 1
execute unless score @s Fame = @s PrevFame run scoreboard players set @s ScoreChanged 1
execute unless score @s PlayerLevel = @s PrevLevel run scoreboard players set @s ScoreChanged 1
execute unless score @s Grade = @s PrevGrade run scoreboard players set @s ScoreChanged 1
execute unless score @s RctUnlocked = @s PrevRctUnlocked run scoreboard players set @s ScoreChanged 1
execute unless score @s SukunaFingers = @s PrevFingers run scoreboard players set @s ScoreChanged 1
execute unless score @s DeathPaintings = @s PrevPaintings run scoreboard players set @s ScoreChanged 1


# If set to display notifications and scores changed, call notification function
# execute if score @s ScoreChanged matches 1 run function jujutsu_debug:internal/notify_score_changes

# Update previous scores to current for next comparison
scoreboard players operation @s PrevCT = @s CurrentCT
scoreboard players operation @s PrevSecondCT = @s SecondCT
scoreboard players operation @s PrevFame = @s Fame
scoreboard players operation @s PrevLevel = @s PlayerLevel
scoreboard players operation @s PrevGrade = @s Grade
scoreboard players operation @s PrevRctUnlocked = @s RctUnlocked

