extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if global.prev_scene == "forest_lvl":
		$Player.position.x = 199
		$Player.position.y = 125
	elif global.prev_scene == "center":
		$Player.position.x = 874
		$Player.position.y = 277
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_forest_lvl_body_entered(body):
	if body.has_method("player"):
		get_tree().change_scene_to_file("res://scenes/forest_lvl.tscn")
	
	


func _on_center_body_entered(body):
	if body.has_method("player"):
		get_tree().change_scene_to_file("res://scenes/center.tscn")
