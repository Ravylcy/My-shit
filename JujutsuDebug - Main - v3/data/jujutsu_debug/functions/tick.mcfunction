# Modified tick.mcfunction to include mob tracking

# JujutsuCraft Debug Tick Function
# Updates scores for all players and mobs every tick

# Ensure the scoreboards exist (only needs to run once, but prevents errors if setup wasn't run)
execute unless score #tick_init jc_debug_init matches 1 run function jujutsu_debug:internal/init_tick

# Update scores for all players
execute as @a run function jujutsu_debug:internal/update_player_scores

# Track score updates for players (used for displaying changes)
execute as @a run function jujutsu_debug:internal/track_score_changes

# Update mob scores for relevant entities (only for entities with ForgeData.skill or ForgeData.cnt6)
execute as @e[type=!player,nbt={ForgeData:{}}] run function jujutsu_debug:internal/update_mob_scores

# Optional: Display status messages for significant changes (uncomment if needed)
# execute as @a run function jujutsu_debug:internal/display_notifications