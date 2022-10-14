extends Sprite

var pos = Vector2(0,0)

func _ready():
	pass
	
func _process(delta):
	set_offset(pos)

func _on_PreView_preview_pos(tile_pos):
	pos = tile_pos
