extends Camera2D

var move_velocity = Vector2.ZERO
var move_speed = 2

var zoom_velocity = Vector2(1,1)
var zoom_speed = 0.01

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("move_up"):
		move_velocity.y = -move_speed
	elif Input.is_action_pressed("move_down"):
		move_velocity.y = move_speed
	elif Input.is_action_pressed("move_right"):
		move_velocity.x = move_speed
	elif Input.is_action_pressed("move_left"):
		move_velocity.x = -move_speed
	elif Input.is_action_pressed("zoom_in"):
		var zoom_lv = zoom_velocity.x - zoom_speed
		if zoom_lv >= 0:
			zoom_velocity = Vector2(zoom_lv,zoom_lv)
		if zoom_lv < 0:
			zoom_velocity = Vector2.ZERO
			zoom_lv = 0
	elif Input.is_action_pressed("zoom_out"):
		zoom_velocity = Vector2(zoom_velocity.x + zoom_speed,zoom_velocity.y + zoom_speed)
	else:
		move_velocity.x = 0
		move_velocity.y = 0
	
	position.x += move_velocity.x
	position.y += move_velocity.y
	
	set_zoom(zoom_velocity)
