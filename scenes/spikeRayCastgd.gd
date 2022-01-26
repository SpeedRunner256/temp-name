extends RayCast2D


func _process(delta):
	print(get_collider())
	if is_colliding():
		
		get_tree().reload_current_scene()
