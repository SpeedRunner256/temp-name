extends RayCast2D


func _process(delta):
	if is_colliding():
		get_collider().queue_free()
