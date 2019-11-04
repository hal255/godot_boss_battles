extends Node

# size of height/width of sprite relatice to each scene square
var size_of_unit = 16
var map_width_units = 20
var map_height_units = 20

var screen_w = map_width_units * size_of_unit
var screen_h = map_height_units * size_of_unit

# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_node("/root")
	resize_viewport(root, screen_w, screen_h)

func resize_viewport(root, width, height):
	root.size = Vector2(width, height)
	print("screen size: %d, %d" %[root.size[0], root.size[1]])

