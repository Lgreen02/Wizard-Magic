extends Node2D
var next_scene = "none"

# Called when the node enters the scene tree for the first time.
func _ready():
	if global.prev_scene == "desert_lvl":
		$Player.position.x = 296
		$Player.position.y = 24
	if global.prev_scene == "desert_house":
		$Player.position.x = 544
		$Player.position.y = 265


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scenes()


func _on_center_body_entered(body):
	if body.has_method("player"):
		next_scene = "center"
		global.transition_scene = true
	
func change_scenes():
	if global.transition_scene:
		if next_scene == "center":
			global.prev_scene = "east"
			get_tree().change_scene_to_file("res://scenes/center/center.tscn")
			global.transition_scene = false
		if next_scene == "desert_lvl":
			global.prev_scene = "east"
			get_tree().change_scene_to_file("res://scenes/desert_lvl/desert_lvl.tscn")
			global.transition_scene = false
		if next_scene == "desert_house":
			global.prev_scene = "east"
			get_tree().change_scene_to_file("res://scenes/east/desert_house.tscn")
			global.transition_scene = false


func _on_desert_lvl_body_entered(body):
	if body.has_method("player"):
		next_scene = "desert_lvl"
		global.transition_scene = true


func _on_desert_house_body_entered(body):
	if body.has_method("player"):
		next_scene = "desert_house"
		global.transition_scene = true
