extends Camera2D

var velocity = Vector2.ZERO
var speed = 2

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		velocity.y = -speed
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0
		velocity.y = 0
	
	position.x += velocity.x
	position.y += velocity.y
