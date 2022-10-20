extends Control

signal block_be_choose(id)

func _ready():
	pass

func _process(delta):
	
	if $Ground/Group/ScrollContainer/HBoxContainer/Tile0.block_id != null:
		emit_signal("block_be_choose",$Ground/Group/ScrollContainer/HBoxContainer/Tile0.block_id)
		$Ground/Group/ScrollContainer/HBoxContainer/Tile0.block_id = null
		
	if $Ground/Group/ScrollContainer/HBoxContainer/Tile1.block_id != null:
		emit_signal("block_be_choose",$Ground/Group/ScrollContainer/HBoxContainer/Tile1.block_id)
		$Ground/Group/ScrollContainer/HBoxContainer/Tile1.block_id = null
		
	if $Ground/Group/ScrollContainer/HBoxContainer/Tile2.block_id != null:
		emit_signal("block_be_choose",$Ground/Group/ScrollContainer/HBoxContainer/Tile2.block_id)
		$Ground/Group/ScrollContainer/HBoxContainer/Tile2.block_id = null
		
	if $Ground/Group/ScrollContainer/HBoxContainer/Tile3.block_id != null:
		emit_signal("block_be_choose",$Ground/Group/ScrollContainer/HBoxContainer/Tile3.block_id)
		$Ground/Group/ScrollContainer/HBoxContainer/Tile3.block_id = null
		
	if $Ground/Group/ScrollContainer/HBoxContainer/Tile4.block_id != null:
		emit_signal("block_be_choose",$Ground/Group/ScrollContainer/HBoxContainer/Tile4.block_id)
		$Ground/Group/ScrollContainer/HBoxContainer/Tile4.block_id = null
