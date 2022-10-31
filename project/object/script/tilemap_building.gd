extends TileMap

var building_tile_id = -1
var building_tile_cost = 0
var building_yield_total = 0
var land_buildable = true
var payable = true
var autobuilding_list = []

signal building_tile(id,x,y)
signal building_cost(cost)
signal building_yield(num)

func _ready():
	for autobuilding_data in autobuilding_list:
		set_cell(autobuilding_data[0], autobuilding_data[1]-2, autobuilding_data[2])

func _process(delta):
	if Input.get_mouse_button_mask() == 1:
		var mouse_pos = get_global_mouse_position()
		var block_pos = [world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1]]
		
		#building_tile_id = 0
		emit_signal("building_tile",building_tile_id,world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1])
		if land_buildable == true:
			if get_cell(block_pos[0], block_pos[1]-2) == -1:
				if payable == true:
					set_cell(block_pos[0], block_pos[1]-2, building_tile_id)
					emit_signal("building_cost",building_tile_cost)
				else:
					pass
		
		# update_dirty_quadrants()
	if Input.get_mouse_button_mask() == 2:
		var mouse_pos = get_global_mouse_position()
		var block_pos = [world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1]]
		#building_tile_id = 1
		emit_signal("building_tile",building_tile_id,world_to_map(mouse_pos)[0],world_to_map(mouse_pos)[1])
		if land_buildable == true:
			if get_cell(block_pos[0], block_pos[1]-2) != -1:
				set_cell(block_pos[0], block_pos[1]-2, -1)
	
	var building_yield_total = 0
	
	var building_512 = get_used_cells_by_id(512).size()
	building_yield_total += building_512
	emit_signal("building_yield",building_yield_total)
	
	


func _on_Land_land_buildable(switch):
	land_buildable = switch
	
func _on_Land_autobuilding_on_land(autobuilding_x,autobuilding_y,autobuilding_id):
	autobuilding_list.append([autobuilding_x,autobuilding_y,autobuilding_id])
