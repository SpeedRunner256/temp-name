extends KinematicBody2D

const GRAVITY = 15
const SPEED = 155
var motion = Vector2.ZERO
var jumpHeight = -280
var jumpCounter = 2
var ifGrav := true
var can_dash = true
func _physics_process(delta):
	if ifGrav:
		motion.y = motion.y + GRAVITY
	else:
		pass
	if is_on_floor():
		jumpCounter = 2
		can_dash = true
	#simple movement, skim through
	motion = move_and_slide(motion, Vector2.UP)
	if Input.is_action_pressed("ui_right"):
		motion.x = lerp(motion.x, SPEED, 0.2)
	elif Input.is_action_pressed("ui_left"):
		motion.x = lerp(motion.x, -SPEED, 0.2)
	else:
		motion.x = lerp(motion.x, 0, 0.2)
	if Input.is_action_just_pressed("ui_accept") and jumpCounter >0:
		motion.y = jumpHeight
		jumpCounter -=1
		if motion.y >= GRAVITY * 100:
			motion.y = GRAVITY*100
	
	
	#DASHHHH
	if Input.is_action_just_pressed("dash") and can_dash:
		ifGrav = false
		motion.y = 0
		$Timer.start()
		can_dash = false
		if motion.x == 0:
			pass
		elif motion.x < 0:
			motion.x = -700
		elif motion.x > 0:
			motion.x = 700

	
func _on_Timer_timeout():
	ifGrav = true
