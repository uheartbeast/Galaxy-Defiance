# Give the component a class name so it can be instanced as a custom node
class_name StateComponent
extends Node

# Create some signals for the state
signal enabled() # Emit when the state has been enabled
signal disabled() # Emit when the state has been disabled
signal state_finished() # Emit when the state is finished (not always the same as diabling it)

# This function is used to disable the state (and all its children)
func disable() -> void:
	disabled.emit()
	# We can set the process mode to disabled to disable the node and its children
	process_mode = Node.PROCESS_MODE_DISABLED

# This function is used to enable the state (and all its children)
func enable() -> void:
	enabled.emit()
	# We can set the process mode to inherit to enable the node and its children
	# We use inheirt so this node will still pause if the game is paused or a parent is disabled
	process_mode = Node.PROCESS_MODE_INHERIT
