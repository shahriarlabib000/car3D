extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	%speed.text = str("%.3f" %$"Nissan GTR".linear_velocity.length())
	if Input.is_action_just_pressed("ui_redo"):
		get_tree().reload_current_scene()
