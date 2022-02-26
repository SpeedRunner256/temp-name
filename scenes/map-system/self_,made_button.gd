extends Area2D

var mouse_in_collision: bool = false

onready var hello = get_parent()

func _physics_process(delta):
	if mouse_in_collision == true and Input.is_action_just_pressed("mouseL"):
		get_tree().change_scene("res://scenes/levels/%s.tscn" % hello.level_number)
func _on_self_made_button_mouse_entered():
	mouse_in_collision = true


func _on_self_made_button_mouse_exited():
	mouse_in_collision = false
