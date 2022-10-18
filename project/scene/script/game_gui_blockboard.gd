extends Control

signal block_be_choose(id)

func _ready():
	# $MenuButton.visible = false
	pass

func _process(delta):
	var block_id_button_list = [$Ground/Group/Tile0.block_id,
								$Ground/Group/Tile1.block_id]
	for id in block_id_button_list:
		if id != null:
			emit_signal("block_be_choose",id)
