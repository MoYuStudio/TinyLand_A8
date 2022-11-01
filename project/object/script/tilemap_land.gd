extends TileMap

var land_map = []

signal land_buildable(switch)
signal autobuilding_on_land(x,y,id)

func _ready():
	var land_noise = OpenSimplexNoise.new()
	var forest_noise = OpenSimplexNoise.new()
	
	randomize()

	land_noise.seed = 0
	land_noise.octaves = 3 # 4
	land_noise.period = 25 # 20.0
	land_noise.persistence = 0.8
	
	forest_noise.seed = land_noise.seed+1000
	forest_noise.octaves = 3 # 4
	forest_noise.period = 25 # 20.0
	forest_noise.persistence = 0.8
	
	var tilemap_board = 128
	var tilemap_offset = 60 # 256 is 40
	
	for x in range(tilemap_board):
		for y in range(tilemap_board*2):
			
			var the_land_noise = land_noise.get_noise_2d(x,y)*100+10
			var the_forest_noise = forest_noise.get_noise_2d(x,y)*100+10

			if the_land_noise <= 0:
				set_cell(x-tilemap_board/2+tilemap_offset, y-tilemap_board/2+tilemap_offset, 4)
			elif the_land_noise <= 7:
				set_cell(x-tilemap_board/2+tilemap_offset, y-tilemap_board/2+tilemap_offset, 2)
			elif the_land_noise <= 43:
				set_cell(x-tilemap_board/2+tilemap_offset, y-tilemap_board/2+tilemap_offset, 0)
			elif the_land_noise <= 50:
				set_cell(x-tilemap_board/2+tilemap_offset, y-tilemap_board/2+tilemap_offset, 1)
			elif the_land_noise <= 100:
				set_cell(x-tilemap_board/2+tilemap_offset, y-tilemap_board/2+tilemap_offset, 3)
				emit_signal("autobuilding_on_land", x-tilemap_board/2+tilemap_offset, y-tilemap_board/2+tilemap_offset, 3)
	
			if the_forest_noise <= -5:
				if get_cell(x-tilemap_board/2+tilemap_offset, y-tilemap_board/2+tilemap_offset) == 2 \
				or get_cell(x-tilemap_board/2+tilemap_offset, y-tilemap_board/2+tilemap_offset) == 3 \
				or get_cell(x-tilemap_board/2+tilemap_offset, y-tilemap_board/2+tilemap_offset) == 4:
					pass
				else:
					emit_signal("autobuilding_on_land", x-tilemap_board/2+tilemap_offset, y-tilemap_board/2+tilemap_offset, 129)
	# print(land_map)

func _process(delta):
	pass

func _on_Building_building_tile(building_id,building_x,building_y):
	if get_cell(building_x,building_y) == 4 or get_cell(building_x,building_y) == -1:
		emit_signal("land_buildable",false)
	else:
		emit_signal("land_buildable",true)
