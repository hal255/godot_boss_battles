extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	var scene_world_node = get_node('/root/world')
	var ui_hotkeys_node = scene_world_node.get_node('ui_panel/ui_hotkeys')
	var screen_size = OS.get_real_window_size()

	# set position of ui_hotkeys
	var texture_size = ui_hotkeys_node.get_texture().get_size()
	ui_hotkeys_node.rect_position[0] = screen_size[0]/2 - texture_size[0]/2
	ui_hotkeys_node.rect_position[1] = screen_size[1] - texture_size[1]*1.5
	
	print('ui_hotkeys_position: ' + str(ui_hotkeys_node.rect_position[0]) + ', ' + str(ui_hotkeys_node.rect_position[1]))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
