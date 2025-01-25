extends VehicleBody3D

@export var max_torque = 5000

@onready var pivot = $pivot
@onready var frontCam = %frontCam
@onready var backCam = %backCam
@onready var pitch = $engineSound.pitch_scale

var lookAt
func _ready():
	lookAt= global_position


func _physics_process(delta):
	steering = lerp(steering, Input.get_axis("ui_right","ui_left") * 0.4,5 * delta)
	
	var accelaration = Input.get_axis("backward","forward") 
	engine_force = accelaration * max_torque

	#camera
	pivot.global_position = pivot.global_position.lerp(global_position + Vector3(0,3,0), delta * 20)
	pivot.transform = pivot.transform.interpolate_with(transform, delta * 5)
	lookAt = lookAt.lerp(global_position + linear_velocity,delta * 5)
	lookAt = global_position#lookAt.lerp(global_position, delta * 5)
	frontCam.look_at(lookAt)
	backCam.look_at(lookAt)
	_check_camera_switch()
	$engineSound.pitch_scale = 0.05 + linear_velocity.length()/100
	
	
func _check_camera_switch():
	if $backleft.get_rpm() < -10:
		backCam.current=true
	else:
		frontCam.current=true
	
