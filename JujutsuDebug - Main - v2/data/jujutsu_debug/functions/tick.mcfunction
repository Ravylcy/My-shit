# JujutsuCraft Debug Tick Function
# Updates scores for all players every tick

# Ensure the scoreboards exist (only needs to run once, but prevents errors if setup wasn't run)
execute unless score #tick_init jc_debug_init matches 1 run function jujutsu_debug:internal/init_tick

# Update scores for all players
execute as @a run function jujutsu_debug:internal/update_player_scores

# Track score updates (used for displaying changes)
execute as @a run function jujutsu_debug:internal/track_score_changes

# Optional: Display status messages for significant changes (uncomment if needed)
# execute as @a run function jujutsu_debug:internal/display_notifications