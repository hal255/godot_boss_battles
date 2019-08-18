extends KinematicBody2D

export (int) var speed = 200
export (int) var reset_speed = 1000
export (float) var rotation_speed = 1.5

var velocity = Vector2()
var is_animating = false

var start_x = 0
var start_y = 0
var target_pos = Vector2()

func _init():
	start_x = position.x
	start_y = position.y

func _physics_process(delta):
	move_and_slide(target_pos * delta)
#	velocity = move_and_slide(target_pos)

func animate_poke():
	var player_body_node = get_parent().toggle_is_attacking(true)
	rotation = deg2rad(-135)
	poke()

func poke():
	var weapon_size_y = get_node('Sprite').get_rect().size[1]
	var player_rotation = get_parent().get_player_rotation()
	target_pos = Vector2(0, weapon_size_y).rotated(player_rotation) * speed
	print("current_pos: ", position.x, ", ", position.y)
	

func cancel_poke():
	var player_body_node = get_parent().toggle_is_attacking(false)
	rotation = deg2rad(0)
	var player_rotation = get_parent().get_player_rotation()
	target_pos = Vector2(0, 0).rotated(player_rotation)
	position.x = start_x
	position.y = start_y
	is_animating = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if not is_animating:
				animate_poke()
		if event.button_index == BUTTON_LEFT and not event.pressed:
			cancel_poke()
