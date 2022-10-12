extends TileMap

var block_pos_backup = [0,0]

func _ready():
	pass

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var block_pos = [world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1]]
	var block_pos_backup = block_pos
	
	if get_cell(block_pos[0], block_pos[1]) == -1:
		set_cell(block_pos_backup[0], block_pos_backup[1], -1)
		set_cell(block_pos[0], block_pos[1], 0)
	# if get_cell(block_pos[0], block_pos[1]) == 0:
	

	print(block_pos_backup)
