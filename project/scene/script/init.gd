extends Node2D

func _ready():
	yield(get_tree().create_timer(1.0), "timeout")
	
	get_tree().change_scene("res://scene/options_menu.tscn")

