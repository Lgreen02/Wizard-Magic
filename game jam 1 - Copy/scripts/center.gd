extends Node2D
var next_scene = "none"

# Called when the node enters the scene tree for the first time.
func _ready():
	if global.prev_scene == "west":
		$Player.position.x = 25
		$Player.position.y = 255
	elif global.prev_scene == "south":
		$Player.position.x = 480
		$Player.position.y = 525
	elif global.prev_scene == "east":
		$Player.position.x = 1139
		$Player.position.y = 417
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scenes()


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		next_scene = "west"
		global.transition_scene = true
func change_scenes():
	if global.transition_scene:
		if next_scene == "west":
			global.prev_scene = "center"
			get_tree().change_scene_to_file("res://main.tscn")
			global.transition_scene = false
		if next_scene == "south":
			global.prev_scene = "center"
			get_tree().change_scene_to_file("res://scenes/south.tscn")
			global.transition_scene = false
		if next_scene == "east":
			global.prev_scene = "center"
			get_tree().change_scene_to_file("res://scenes/east.tscn")
			global.transition_scene = false


func _on_south_body_entered(body):
	if body.has_method("player"):
		next_scene = "south"
		global.transition_scene = true


func _on_east_body_entered(body):
	if body.has_method("player"):
		next_scene = "east"
		global.transition_scene = true
