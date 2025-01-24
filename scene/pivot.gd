extends Node3D

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		rotation.y -= event.relative.x * 0.01
		rotation.x -= event.relative.y * 0.01
