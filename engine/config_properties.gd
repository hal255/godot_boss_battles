# this script serves as a property config class with given filename
# not intended to attach to a scene object

extends Node

static func get_config():
	var config_properties = {
		'player': {
			'health': 100,
			'damage': 10,
			'walk_speed': 300,
			'slide_speed': 2,
			'h_direction': 0,
			'v_direction': 0,
			'swing_speed': 300,
			'swing_rotate_speed': 1.5
		}
	}

	var screen_size = OS.get_screen_size()
	config_properties['screen_width'] = screen_size[0]
	config_properties['screen_height'] = screen_size[1]
	
	return config_properties
	
