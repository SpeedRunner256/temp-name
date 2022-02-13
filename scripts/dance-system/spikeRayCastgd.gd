extends Node2D
var start_move = false
export var STATE := 0

func _physics_process(delta):
	if start_move == true:
		match STATE:
			0:
				position.x -= 1
			1:
				position.x +=1
			2:
				position.y -= 1
			3:
				position.y += 1
	if $RayCast2D.is_colliding():
		print(get_tree().reload_current_scene())
func _on_start_moving_timeout():
	start_move = true
	$stop__moving.start()

func _on_stop__moving_timeout():
	start_move = false
	
