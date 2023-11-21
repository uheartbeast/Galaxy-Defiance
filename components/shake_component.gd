# Give the component a class name so it can be instanced as a custom node
class_name ShakeComponent
extends Node

# You should shake the sprite and not the root node or you'll get unexpected behavior
# since we are manipulating the position of the node and moving it to 0,0

# Export the node that this component will be shaking
@export var node: Node2D

# Export the shake amount
@export var shake_amount: = 2.0

# Export the shake duration
@export var shake_duration: = 0.4

# Store the current amount we are shaking the node (this value will decrease over time)
var shake = 0

# This is the function that activates this component
func tween_shake():
	# Set the shake to the shake amount (shake is the value used in the process function to
	# shake the node)
	shake = shake_amount
	
	# Create a tween
	var tween = create_tween()
	
	# Tween the shake value from current down to 0 over the shake duration
	tween.tween_property(self, "shake", 0.0, shake_duration).from_current()

func _physics_process(delta: float) -> void:
	# Manipulate the position of the node by the shake amount every physics frame
	# Use randf_range to pick a random x and y value using the shake value
	node.position = Vector2(randf_range(-shake, shake), randf_range(-shake, shake))
