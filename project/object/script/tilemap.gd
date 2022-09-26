extends TileMap

func _ready():
	set_cell(3, 3, 1)
	pass

func _process(delta):
	if Input.get_mouse_button_mask() == 1:
		var mouse_pos = get_global_mouse_position()
		set_cell(world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1], 1)
		# update_dirty_quadrants()
	if Input.get_mouse_button_mask() == 2:
		var mouse_pos = get_global_mouse_position()
		set_cell(world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1], -1)
