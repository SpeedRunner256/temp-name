extends Node2D
var timer = false
func _process(delta): 
	if timer:
		position.x -= 1.35
func _on_Timer_timeout():
	timer = true

  
