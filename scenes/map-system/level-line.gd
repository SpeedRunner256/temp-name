extends Node2D


func _physics_process(delta):
	if Input.is_action_just_pressed("ui_right"):
		position.x -= 128
	elif Input.is_action_just_pressed("ui_left"):
		position.x += 128
	
