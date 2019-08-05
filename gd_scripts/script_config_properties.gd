extends Node
var DEBUG = false

func get_config(filename):
	if DEBUG:
		print('setting up configurations for scene')
		
	var config_file = File.new()
	if config_file.open('res://resources/' + filename, File.READ) != OK:
		print(filename + ' NOT found')
		return
		
	var config_json = JSON.parse(config_file.get_as_text()).result
	config_file.close()

	var screen_size = OS.get_screen_size()
	config_json['screen_width'] = screen_size[0]
	config_json['screen_height'] = screen_size[1]
	if DEBUG:
		print(str('screen_width: ', config_json['screen_width']))
		print(str('screen_height: ', config_json['screen_height']))
	
	return config_json
	
