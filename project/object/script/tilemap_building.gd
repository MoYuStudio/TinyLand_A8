extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.get_mouse_button_mask() == 1:
		var mouse_pos = get_global_mouse_position()
		set_cell(world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1], 0)
		# update_dirty_quadrants()
	if Input.get_mouse_button_mask() == 2:
		var mouse_pos = get_global_mouse_position()
		set_cell(world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1], 1)
