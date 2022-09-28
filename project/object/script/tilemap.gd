extends TileMap

func _ready():
	var noise = OpenSimplexNoise.new()
	randomize()
	# Configure the OpenSimplexNoise instance.
	noise.seed = 0
	noise.octaves = 3 # 4
	noise.period = 25 # 20.0
	noise.persistence = 0.8
	
	var tilemap_board = 128
	for x in range(tilemap_board):
		for y in range(tilemap_board*2):
			var the_noise = noise.get_noise_2d(x,y)*100+10
			print(the_noise)
			if the_noise <= 0:
				set_cell(x, y, 4)
			elif the_noise <= 10:
				set_cell(x, y, 2)
			elif the_noise <= 40:
				set_cell(x, y, 0)
			elif the_noise <= 50:
				set_cell(x, y, 1)
			elif the_noise <= 100:
				set_cell(x, y, 3)

func _process(delta):
	if Input.get_mouse_button_mask() == 1:
		var mouse_pos = get_global_mouse_position()
		set_cell(world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1], 1)
		# update_dirty_quadrants()
	if Input.get_mouse_button_mask() == 2:
		var mouse_pos = get_global_mouse_position()
		set_cell(world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1], -1)
