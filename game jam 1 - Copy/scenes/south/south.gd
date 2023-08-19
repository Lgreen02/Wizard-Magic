extends Node2D
var next_scene = "none"

# Called when the node enters the scene tree for the first time.
func _ready():
	if global.prev_scene == "ice_lvl":
		$Player.position.x = 1150
		$Player.position.y = 314
	if global.prev_scene == "south_house":
		$Player.position.x = 199
		$Player.position.y = 255
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scenes()


func _on_ice_lvl_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true
		next_scene = "ice_lvl"
	
func change_scenes():
	if global.transition_scene:
		global.prev_scene = "south"
		if next_scene == "center":
			get_tree().change_scene_to_file("res://scenes/center/center.tscn")
		if next_scene == "ice_lvl":
			get_tree().change_scene_to_file("res://scenes/ice_lvl/ice_lvl.tscn")
		if next_scene == "south_house":
			get_tree().change_scene_to_file("res://scenes/south/south_house.tscn")
		global.transition_scene = false


func _on_center_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true
		next_scene = "center"


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true
		next_scene = "south_house"
