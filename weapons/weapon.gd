extends Node2D

var body_type 	= null
var damage 		= 1
var max_amount 	= 1		# max amount in screen

func _ready():
	body_type = get_parent().body_type

	# if animation is finished, destroy self (similar to C# promise?)
	$anim.connect("animation_finished", self, "destroy")

	$anim.play(str("swing_", get_parent().sprite_dir))
	
	# switches parent state to attack
	if get_parent().has_method("state_attack"):
		get_parent().state = "attack"
	
func destroy(animation):
	# when parent finished attacking, change state back to default
	if get_parent().has_method("state_attack"):
		get_parent().state = "default"

	queue_free()	# frees up memory when called

