extends KinematicBody2D

onready var config_script = preload('res://gd_scripts/script_config_properties.gd')

var DEBUG = true

var motion = Vector2()

var h_direction = 0
var v_direction = 0

var config_properties = null

func _ready():
	var config_file = 'config.json'
	var temp_config = config_script.new()
	config_properties = temp_config.get_config(config_file)['config_properties']
	temp_config = null
	if DEBUG:
		print('running player_movement')

func _physics_process(delta):
	
	flip_player_image()
	
	motion.x = 0
	motion.y = 0
	
	if Input.is_key_pressed(KEY_RIGHT) or Input.is_key_pressed(KEY_D):
		motion.x = config_properties['player']['walk_speed']
	elif Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_A):
		motion.x = config_properties['player']['walk_speed'] * -1
	
	if Input.is_key_pressed(KEY_UP) or Input.is_key_pressed(KEY_W):
		motion.y = config_properties['player']['walk_speed'] * -1
	elif Input.is_key_pressed(KEY_DOWN) or Input.is_key_pressed(KEY_S):
		motion.y = config_properties['player']['walk_speed']
	
	if Input.is_key_pressed(KEY_SPACE):
		motion.x = motion.x * config_properties['player']['slide_speed']
		motion.y = motion.y * config_properties['player']['slide_speed']
		
	move_and_slide(motion)
	
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

	get_node('Sprite').set_flip_h(h_direction)
	get_node('Sprite').set_flip_v(v_direction)

