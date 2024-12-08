extends Node2D

export(Vector2) var stick_position := Vector2.ZERO
export(Vector2) var button_a_position := Vector2.ZERO
export(Vector2) var button_b_position := Vector2.ZERO

onready var stick :=  $Stick
onready var button_a :=  $button_a
onready var button_b :=  $button_b

func _ready():
	var screen_size_px := get_viewport().size
	var stick_offset_px : Vector2 = stick.normal.get_size() / 2
	var button_a_offset_px : Vector2 = button_a.normal.get_size() / 2
	var button_b_offset_px : Vector2 = button_b.normal.get_size() / 2

	var stick_remap_pos := Vector2(
		remap_range(stick_position.x, -1,1,0, screen_size_px.x),
		remap_range(stick_position.y, -1,1,0, screen_size_px.y)
	)

	var button_a_remap_pos := Vector2(
		remap_range(button_a_position.x, -1,1,0, screen_size_px.x),
		remap_range(button_a_position.y, -1,1,0, screen_size_px.y)
	)
	
	var button_b_remap_pos := Vector2(
		remap_range(button_b_position.x, -1,1,0, screen_size_px.x),
		remap_range(button_b_position.y, -1,1,0, screen_size_px.y)
	)

	var stick_position_px := stick_remap_pos - stick_offset_px
	var button_a_position_px := button_a_remap_pos - button_a_offset_px
	var button_b_position_px := button_b_remap_pos - button_b_offset_px
	
	stick.original_position = stick_position_px
	stick.set_global_position(stick_position_px)
	button_a.set_global_position(button_a_position_px)
	button_b.set_global_position(button_b_position_px)


func remap_range(value, input_a,input_b, output_a,output_b):
	return(value-input_a)/(input_b - input_a) * (output_b - output_a) + output_a

