extends Node2D

signal building_cost(cost)

func _ready():
	pass

func _process(delta):
	pass

func _on_BlockboardGroup_block_be_choose(id,cost):
	$Building.building_tile_id = id
	$Building.building_tile_cost = cost

func _on_Building_building_cost(cost):
	emit_signal("building_cost",cost)

func _on_Infoboard_payable(switch):
	$Building.payable = switch
