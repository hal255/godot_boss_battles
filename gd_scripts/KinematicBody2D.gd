extends KinematicBody2D

var motion = Vector2()


func _physics_process(delta):
	if Input.is_action_just_pressed("ui_right"):
		motion.x = 100
	elif Input.is_action_just_pressed("ui_left"):
		motion.x = -100
	
	if Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left"):
		motion.x = 0
		motion.y = 0
	move_and_slide(motion)
	pass