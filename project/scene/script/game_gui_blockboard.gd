extends Control

var the_group = null

signal block_be_choose(id)

func _ready():
	yield(get_tree().create_timer(0.1), "timeout")

func _process(delta):
	
	var group_list = [
						'Ground/Group',
						'Farming/Group',
						'Industrial/Group',
						'Finance/Group',
						'Infrastructure/Group',
						'Other/Group'
					]
	
	for group in group_list:
		if group != the_group:
			if get_node(group).visible == true:
				the_group = group
				var group_list_coby = group_list
				group_list_coby.erase(group)
				for group_copy in group_list_coby:
					get_node(group_copy).visible = false
					
	var tile_list = [
						$Ground/Group/ScrollContainer/HBoxContainer/Tile0,
						$Ground/Group/ScrollContainer/HBoxContainer/Tile1,
						$Ground/Group/ScrollContainer/HBoxContainer/Tile2,
						$Ground/Group/ScrollContainer/HBoxContainer/Tile3,
						$Ground/Group/ScrollContainer/HBoxContainer/Tile4,
						
						$Farming/Group/ScrollContainer/HBoxContainer/Tile0,
						$Farming/Group/ScrollContainer/HBoxContainer/Tile1,
						$Farming/Group/ScrollContainer/HBoxContainer/Tile2,
						$Farming/Group/ScrollContainer/HBoxContainer/Tile3,
						$Farming/Group/ScrollContainer/HBoxContainer/Tile4,
						
						$Industrial/Group/ScrollContainer/HBoxContainer/Tile0,
						
						$Finance/Group/ScrollContainer/HBoxContainer/Tile0
					]
				
	for tile in tile_list:
		if tile.block_id != null:
			emit_signal("block_be_choose",tile.block_id)
			tile.block_id = null
		

