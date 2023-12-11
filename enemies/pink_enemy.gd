class_name PinkEnemy
extends Enemy

@onready var states: Node = $States

@onready var move_down_state: = %MoveDownState as TimedStateComponent
@onready var move_side_state: = %MoveSideState as TimedStateComponent
@onready var pause_state: = %PauseState as TimedStateComponent
@onready var fire_state: = %FireState as StateComponent
@onready var move_side_component: = %MoveSideComponent as MoveComponent
@onready var projectile_spawner_component: = %ProjectileSpawnerComponent as SpawnerComponent

func _ready() -> void:
	super()
	
	for state in states.get_children():
		state = state as StateComponent
		state.disable()
	
	move_side_component.velocity.x = [-20, 20].pick_random()
	
	move_down_state.state_finished.connect(move_side_state.enable)
	move_side_state.state_finished.connect(func():
		fire_state.enable()
		scale_component.tween_scale()
		projectile_spawner_component.spawn(global_position)
		fire_state.disable()
		fire_state.state_finished.emit()
	)
	fire_state.state_finished.connect(pause_state.enable)
	pause_state.state_finished.connect(move_down_state.enable)
	
	move_down_state.enable()
