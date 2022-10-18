extends Node2D

func _ready():
	pass

func _process(delta):
	pass


func _on_BlockboardGroup_block_be_choose(id):
	$Building.building_tile_id = id
