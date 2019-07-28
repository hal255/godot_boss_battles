extends Node
var DEBUG = true

func get_config(filename):
	if DEBUG:
		print('setting up configurations for scene')
		
	var config_file = File.new()
	if config_file.open('res://resources/' + filename, File.READ) != OK:
		print(filename + ' NOT found')
		return
		
	var config_json = JSON.parse(config_file.get_as_text()).result
	config_file.close()
	
	return config_json
