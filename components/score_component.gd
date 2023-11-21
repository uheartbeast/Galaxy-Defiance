# Give the component a class name so it can be instanced as a custom node
class_name ScoreComponent
extends Node

# Export the game stats so we can manipulate the game score
@export var game_stats: GameStats

# Export the amount the score should be adjusted
@export var adjust_amount = 5

# This is the function that we call to activate this component. By default it will
# Use the adjust_amount when called but we could optionally pass in a different amount.
func adjust_score(amount: int = adjust_amount):
	game_stats.score += amount
