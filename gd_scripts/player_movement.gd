extends KinematicBody2D

var motion = Vector2()
var speed = 300
var slide_multiplier = 3

var h_direction = 0
var v_direction = 0

func _physics_process(delta):
	flip_player_image()
	
	motion.x = 0
	motion.y = 0
	
	if Input.is_key_pressed(KEY_RIGHT) or Input.is_key_pressed(KEY_D):
		motion.x = speed
	elif Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_A):
		motion.x = speed * -1
	
	if Input.is_key_pressed(KEY_UP) or Input.is_key_pressed(KEY_W):
		motion.y = speed * -1
	elif Input.is_key_pressed(KEY_DOWN) or Input.is_key_pressed(KEY_S):
		motion.y = speed
	
	if Input.is_key_pressed(KEY_SPACE):
		motion.x = motion.x * slide_multiplier
		motion.y = motion.y * slide_multiplier
		
	
	move_and_slide(motion)
	pass
	
func flip_player_image():
	# flip horizontal
	if Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_A):
		h_direction = 0
	elif Input.is_key_pressed(KEY_RIGHT) or Input.is_key_pressed(KEY_D):
		h_direction = 1
	
	# flip vertical
	if Input.is_key_pressed(KEY_UP) or Input.is_key_pressed(KEY_W):
		v_direction = 1
	elif Input.is_key_pressed(KEY_DOWN) or Input.is_key_pressed(KEY_S):
		v_direction = 0

	get_node("Sprite").set_flip_h(h_direction)
	get_node("Sprite").set_flip_v(v_direction)
