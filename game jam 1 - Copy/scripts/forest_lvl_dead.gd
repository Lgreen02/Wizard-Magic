extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scenes()


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true
	

func change_scenes():
	if global.transition_scene:
		global.prev_scene = "forest_lvl"
		get_tree().change_scene_to_file("res://main.tscn")
		global.transition_scene = false

func _on_area_2d_body_exited(body):
	global.transition_scene = false
