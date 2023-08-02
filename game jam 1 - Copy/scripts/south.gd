extends Node2D
var next_scene = "none"

# Called when the node enters the scene tree for the first time.
func _ready():
	if global.prev_scene == "ice_lvl":
		$Player.position.x = 1150
		$Player.position.y = 314
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scenes()


func _on_ice_lvl_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true
		next_scene = "ice_lvl"
	
func change_scenes():
	if global.transition_scene:
		if next_scene == "center":
			global.prev_scene = "south"
			get_tree().change_scene_to_file("res://scenes/center.tscn")
			global.transition_scene = false
		if next_scene == "ice_lvl":
			global.prev_scene = "center"
			get_tree().change_scene_to_file("res://scenes/ice_lvl.tscn")
			global.transition_scene = false


func _on_center_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true
		next_scene = "center"
