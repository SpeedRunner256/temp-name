extends KinematicBody2D

const TILE_SIZE = 16

export var walk_speed = 3

var motion := Vector2.ZERO
var initial_position = Vector2.ZERO
var input_direction = Vector2.ZERO
var is_moving = false
var percent_moved_to_next_tile := 0.0

func _ready():
	initial_position = position


func _physics_process(delta): 
	if is_moving == false:
		process_move_player()
	elif input_direction != Vector2.ZERO:
		move(delta)
	#animations
	if input_direction == Vector2.LEFT:
		$AnimationSprite.flip_h = true
		$AnimationSprite.set_animation("Side")
	elif input_direction == Vector2.RIGHT:
		$AnimationSprite.set_animation("Side")
		$AnimationSprite.flip_h = false
	elif input_direction == Vector2.UP:
		$AnimationSprite.set_animation("up")
	elif input_direction == Vector2.DOWN:
		$AnimationSprite.set_animation("Front")
	
			
func process_move_player():
	if input_direction.y == 0:
		input_direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	if input_direction.x == 0:
		input_direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	if input_direction !=Vector2.ZERO:
		initial_position = position
		is_moving = true
func move(delta):
	percent_moved_to_next_tile += walk_speed *delta
	if percent_moved_to_next_tile >= 1:
		position = initial_position + (TILE_SIZE * input_direction)
		percent_moved_to_next_tile = 0
		is_moving = false
	else:
		position = initial_position + (TILE_SIZE * input_direction * percent_moved_to_next_tile)
