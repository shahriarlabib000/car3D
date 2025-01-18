extends MeshInstance3D

var points:Array[Vector3] = []
@export var marker:Marker3D
@export var size := 300
@export var offset := Vector3(0.2,0,0)
func _ready() -> void:
	mesh = ImmediateMesh.new()


func _physics_process(_delta: float) -> void:
	if !is_instance_valid(marker):
		
		return
	points.append(marker.global_position)
	mesh.clear_surfaces()
	mesh.surface_begin(Mesh.PRIMITIVE_TRIANGLE_STRIP)
	for point in points:
		mesh.surface_add_vertex(point - marker.global_basis * offset)
		mesh.surface_add_vertex(point + marker.global_basis * offset)
	mesh.surface_end()
	
	if points.size() > size:
		points.pop_front()
