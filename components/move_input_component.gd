class_name MoveInputComponent
extends Node

@export var move_stats: MoveStats
@export var move_component: MoveComponent

func _input(event: InputEvent) -> void:
	var input_axis = Input.get_axis("ui_left", "ui_right")
	move_component.velocity = Vector2(input_axis * move_stats.speed, 0)
