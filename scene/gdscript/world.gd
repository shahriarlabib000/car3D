extends Node3D

func _process(_delta):
	%speed.text = str("%.3f" %$"Nissan GTR".linear_velocity.length())
	if Input.is_action_just_pressed("ui_redo"):
		get_tree().reload_current_scene()
