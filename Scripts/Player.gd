extends MeshInstance

export(float) var speed := 10.0
onready var vc_stick := $VirtualJoystick/Stick

func _process(delta):
	var movement := Vector3(
		vc_stick.axis.x, 0, vc_stick.axis.y
	)
	global_transform.origin += movement.normalized() * speed * delta
	
	if Input.is_action_just_pressed("button_a"):
		_set_color(Color.blueviolet)
	
	if Input.is_action_just_pressed("button_b"):
		_set_color(Color.deeppink)

func _set_color(color:Color) -> void:
	var mat := get_active_material(0)
	mat.albedo_color = color
	set_surface_material(0,mat)
