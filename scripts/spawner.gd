extends Node2D

var counter = 0
var base = preload("res://scenes/blocks/simple.tscn")
var bc = preload("res://scenes/blocks/blockWithComplete.tscn")
func _on_Timer_timeout():
		var Base = base.instance()
		add_child(Base)
		Base.position.y = rand_range(-60,60)
		counter = counter + 1
		if counter==10:
			var BC = bc.instance()
			add_child(BC)
			BC.position.y = rand_range(-60,60)
			$Timer.queue_free()
