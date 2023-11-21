# Give the component a class name so it can be instanced as a custom node
class_name PositionClampComponent
extends Node2D

# Export the actor who's position will be clamped
@export var actor: Node2D

# Export a margin for left and right (margin.x) and top and bottom (margin.y)
@export var margin: = 8

# Define the left and right borders to bounce on
var left_border = 0
# Use the display viewport width to get the right border of the screen
var right_border = ProjectSettings.get_setting("display/window/size/viewport_width")

func _process(delta: float) -> void:
	# clamp the x position of the actor between the left border and the right border (accounting for the margin)
	actor.global_position.x = clamp(actor.global_position.x, left_border+margin, right_border-margin)
