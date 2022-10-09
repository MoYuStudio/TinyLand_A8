extends TileMap

var land_map = []

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
			# print(the_noise)
			if the_noise <= 0:
				set_cell(x-tilemap_board/2, y-tilemap_board/2, 4)
			elif the_noise <= 7:
				set_cell(x-tilemap_board/2, y-tilemap_board/2, 2)
			elif the_noise <= 43:
				set_cell(x-tilemap_board/2, y-tilemap_board/2, 0)
			elif the_noise <= 50:
				set_cell(x-tilemap_board/2, y-tilemap_board/2, 1)
			elif the_noise <= 100:
				set_cell(x-tilemap_board/2, y-tilemap_board/2, 3)
	
	print(land_map)

func _process(delta):
	pass

func _on_Building_land_tile(building_id,building_x,building_y):
	print(building_id,':',building_x,'//',building_y)
	pass
