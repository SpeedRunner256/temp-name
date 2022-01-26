extends KinematicBody2D

const GRAVITY = 15
const SPEED = 150
var motion = Vector2.ZERO
var jumpHeight = -280
var jumpCounter = 2
func _physics_process(delta):
	if is_on_floor():
		jumpCounter = 2
	#simple movement, skim through
	motion = move_and_slide(motion, Vector2.UP)
	if Input.is_action_pressed("ui_right"):
		motion.x = lerp(motion.x, SPEED, 0.2)
	elif Input.is_action_pressed("ui_left"):
		motion.x = lerp(motion.x, -SPEED, 0.2)
	else:
		motion.x = lerp(motion.x, 0, 0.2)
	if Input.is_action_just_pressed("ui_accept") and jumpCounter !=0:
		motion.y = jumpHeight
		jumpCounter -=1
	else:
		motion.y += GRAVITY
		if motion.y >= GRAVITY * 100:
			motion.y = GRAVITY*100
