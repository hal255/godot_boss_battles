extends BaseButton

var player_weapon_sprite
var weapon_texture

func _ready():
	player_weapon_sprite = get_tree().get_root().get_node('./world/player/player_weapon/Sprite')
	weapon_texture = 'res://assets/art/my_kenney_assets/cursorSword_gold.png'

# Called when the node enters the scene tree for the first time.
func _pressed():
	if '01' in self.name:
		weapon_texture = 'res://assets/art/my_kenney_assets/cursorSword_silver.png'
	elif '02' in self.name:
		weapon_texture = 'res://assets/art/my_kenney_assets/cursorSword_bronze.png'
	else:
		weapon_texture = 'res://assets/art/my_kenney_assets/cursorSword_gold.png'
		
		
	player_weapon_sprite.texture = load(weapon_texture)
	pass # Replace with function body.
