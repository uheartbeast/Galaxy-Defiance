extends Enemy

func _ready() -> void:
	super()
	move_component.velocity.x = [-20, 20].pick_random()
