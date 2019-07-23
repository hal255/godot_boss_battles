extends KinematicBody2D

var motion = Vector2()
var speed = 300
var slide_multiplier = 3


func _physics_process(delta):
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