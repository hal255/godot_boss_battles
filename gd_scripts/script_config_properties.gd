# this script serves as a property config class with given filename
# not intended to attach to a scene object

extends Node
var DEBUG = false

var config_properties

func _init():
	config_properties = {
		'player': {
			'walk_speed': 300,
			'slide_speed': 3,
			'h_direction': 0,
			'v_direction': 0,
			'swing_speed': 300,
			'swing_rotate_speed': 1.5
		}
	}

func get_config():
	if DEBUG:
		print('setting up configurations for scene')

	var screen_size = OS.get_screen_size()
	config_properties['screen_width'] = screen_size[0]
	config_properties['screen_height'] = screen_size[1]
	if DEBUG:
		print(str('screen_width: ', config_properties['screen_width']))
		print(str('screen_height: ', config_properties['screen_height']))
	
	return config_properties
	
