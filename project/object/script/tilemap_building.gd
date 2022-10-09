extends TileMap

var building_tile_id = 0

signal land_tile(id,x,y)

func _ready():
	
	pass

func _process(delta):
	if Input.get_mouse_button_mask() == 1:
		var mouse_pos = get_global_mouse_position()
		building_tile_id = 0
		set_cell(world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1], building_tile_id)
		emit_signal("land_tile",building_tile_id,world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1])
		# update_dirty_quadrants()
	if Input.get_mouse_button_mask() == 2:
		var mouse_pos = get_global_mouse_position()
		building_tile_id = 1
		set_cell(world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1], building_tile_id)
		emit_signal("land_tile",building_tile_id,world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1])
