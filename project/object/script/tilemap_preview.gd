extends TileMap

signal preview_pos(pos)

func _ready():
	pass

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var block_pos = Vector2(world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1])
	
	emit_signal("preview_pos",map_to_world(block_pos))
