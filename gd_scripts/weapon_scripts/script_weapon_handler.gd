extends KinematicBody2D

#onready var config_script = preload('res://gd_scripts/config_properties.gd')
#
#var DEBUG = true
#
#var motion = Vector2()
#var h_direction = 0
#var v_direction = 0
#var config_properties = null
#var in_animation = false
#
## weapon swing motion
#var velocity = Vector2()
#var rotation_dir = 0
#
#func _ready():
#	var config_file = 'config.json'
#	var temp_config = config_script.new()
#	config_properties = temp_config.get_config(config_file)['config_properties']
#	temp_config = null
#	if DEBUG:
#		print('running player_weapon')
#
#func _physics_process(delta):
#    rotation += rotation_dir * rotation_speed * delta
#    velocity = move_and_slide(velocity)

export (int) var speed = 200
export (float) var rotation_speed = 1.5

var velocity = Vector2()
var rotation_dir = 0

func get_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_key_pressed(KEY_L):
		rotation_dir += 1
	if Input.is_key_pressed(KEY_J):
		rotation_dir -= 1
	if Input.is_key_pressed(KEY_K):
		velocity = Vector2(-speed, 0).rotated(rotation)
	if Input.is_key_pressed(KEY_I):
		velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	get_input()
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		rotation = -2.5
#	print(rotation)
	velocity = move_and_slide(velocity)