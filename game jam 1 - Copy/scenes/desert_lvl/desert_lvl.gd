extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if global.prev_scene == "desert2d":
		$Player.position.x = 499
		$Player.position.y = 424

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scenes()
func change_scenes():
	if global.transition_scene:
		global.prev_scene = "desert_lvl"
		get_tree().change_scene_to_file("res://scenes/east/east.tscn")
		global.transition_scene = false

func _on_east_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true


func _on_transition_box_body_entered(body):
	if body.has_method("player"):
		get_tree().change_scene_to_file("res://scenes/desert2d/desert_2d.tscn")
