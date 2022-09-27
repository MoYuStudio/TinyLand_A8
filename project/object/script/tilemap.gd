extends TileMap

func _ready():
	var noise = OpenSimplexNoise.new()
	randomize()
	# Configure the OpenSimplexNoise instance.
	noise.seed = 10000
	noise.octaves = 4
	noise.period = 20.0
	noise.persistence = 0.8
	
	var tilemap_board = 128
	for x in range(tilemap_board):
		for y in range(tilemap_board*2):
			var the_noise = noise.get_noise_2d(x,y)*100+10
			# print(the_noise)
			if the_noise <= 0:
				set_cell(x, y, 1)
			elif the_noise <= 10:
				set_cell(x, y, 2)
			elif the_noise <= 100:
				set_cell(x, y, 0)

func _process(delta):
	if Input.get_mouse_button_mask() == 1:
		var mouse_pos = get_global_mouse_position()
		set_cell(world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1], 1)
		# update_dirty_quadrants()
	if Input.get_mouse_button_mask() == 2:
		var mouse_pos = get_global_mouse_position()
		set_cell(world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1], -1)
