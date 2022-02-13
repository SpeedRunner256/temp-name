extends StaticBody2D

var start_move = false
export var STATE := 0
func _ready():
	$start_moving.start()

func _physics_process(delta):
	if $start_moving.time_left != 0:
		$Label.text = String(int($start_moving.time_left+1))
	else:
		$Label.text = ""
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

func _on_start_moving_timeout():
	start_move = true
	$stop__moving.start()

func _on_stop__moving_timeout():
	start_move = false
