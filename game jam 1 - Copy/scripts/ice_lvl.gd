extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scenes()
func change_scenes():
	if global.transition_scene:
		global.prev_scene = "ice_lvl"
		get_tree().change_scene_to_file("res://scenes/south.tscn")
		global.transition_scene = false


func _on_south_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true
