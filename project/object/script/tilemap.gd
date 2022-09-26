extends TileMap

func _ready():
	var noise = OpenSimplexNoise.new()
	randomize()
	# Configure the OpenSimplexNoise instance.
	noise.seed = 10000
	noise.octaves = 4
	noise.period = 20.0
	noise.persistence = 0.8

	#for i in 100:
		# Prints a slowly-changing series of floating-point numbers
		# between -1.0 and 1.0.
		#print(noise.get_noise_2d(i))
	
	var tilemap_board = 32
	for x in range(tilemap_board):
		for y in range(tilemap_board*2):
			var the_noise = noise.get_noise_2d(x,y)*100+10
			if the_noise >= 0:
				set_cell(x, y, 0)
			if the_noise <= 0:
				set_cell(x, y, 1)

func _process(delta):
	if Input.get_mouse_button_mask() == 1:
		var mouse_pos = get_global_mouse_position()
		set_cell(world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1], 1)
		# update_dirty_quadrants()
	if Input.get_mouse_button_mask() == 2:
		var mouse_pos = get_global_mouse_position()
		set_cell(world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1], -1)
