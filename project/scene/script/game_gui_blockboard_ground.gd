extends Button

func _ready():
	$GroundGroup.visible = false
	connect("pressed", self, "_button_pressed")

func _button_pressed():
	print($GroundGroup.visible)
	if $GroundGroup.visible == false:
		$GroundGroup.visible = true
	elif $GroundGroup.visible == true:
		$GroundGroup.visible = false
