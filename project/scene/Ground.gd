extends Button

func _ready():
	$GroundGroup.visible = false
	connect("pressed", self, "_button_pressed")

func _button_pressed():
	if $GroundGroup.visible == true:
		$GroundGroup.visible = false
	elif $GroundGroup.visible == false:
		$GroundGroup.visible = true
	
