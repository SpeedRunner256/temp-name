extends RayCast2D


func _process(delta):
	if is_colliding():
		get_tree().reload_current_scene()
