extends Sprite

func _ready():
	pass
	
func _process(delta):
	var mouse_pos = get_global_mouse_position()
	mouse_pos = Vector2(mouse_pos[0],mouse_pos[1])
	set_offset(mouse_pos)
