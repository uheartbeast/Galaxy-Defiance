# Give the component a class name so it can be instanced as a custom node
class_name VariablePitchAudioStreamPlayer
extends AudioStreamPlayer

# This custom node is used to easily play a sound with a variable pitch

# Export the minimum and maximum pitch amounts
@export var pitch_min = 0.6
@export var pitch_max = 1.2

# Allow the node to automatically play the sound with the pitch variance
@export var auto_play_with_variance: = false

func _ready() -> void:
	# If auto play with variance is on, call the function to play the sound in the ready function
	if auto_play_with_variance:
		play_with_variance(0.0)

# This is the function for playing the sound using a variance in the pitch
func play_with_variance(from_position: float = 0.0) -> void:
	# Set the pitch scale before playing the sound (picking a random amount between the minimum and maximum)
	pitch_scale = randf_range(pitch_min, pitch_max)
	play(from_position)
