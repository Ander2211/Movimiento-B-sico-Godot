extends TouchScreenButton

export(float) var radius := 90.0

var axis := Vector2.ZERO
var tracking := false 
var original_position := Vector2.ZERO

onready var offset := normal.get_size() / 2

func _process(_delta):
	if tracking:
		var diff :=  (
			get_global_mouse_position()- offset - original_position
		)

		axis = diff.clamped(1.0)
		set_global_position(original_position + diff.clamped(radius))
	else:
		axis = Vector2.ZERO   
		set_global_position(original_position)
	
	if Input.is_action_just_pressed("stick"):
		tracking = true
	
	if Input.is_action_just_released("stick"):
		tracking = false
