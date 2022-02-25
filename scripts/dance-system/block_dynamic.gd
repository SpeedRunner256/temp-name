extends StaticBody2D

var start_move = false
export var start_movin : float= 3
export var STATE := 0
func _ready():
	$start_moving.wait_time = start_movin
	$start_moving.start()

func _physics_process(delta):
	if $start_moving.time_left != 0:
		$Label.text = String(int($start_moving.time_left+1))
	else:
		$Label.text = ""
	if start_move == true:
		match STATE:
			0: #left
				position.x -= 1
			1: #right
				position.x +=1
			2: #up
				position.y -= 1
			3: #down
				position.y += 1

func _on_start_moving_timeout():
	start_move = true
	$stop__moving.start()

func _on_stop__moving_timeout():
	start_move = false
