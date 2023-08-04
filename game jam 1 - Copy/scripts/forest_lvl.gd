extends Node2D

var skelly_talk = false
var forest_level_transition = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if global.prev_scene == "west":
		$Player.position.x = 467
		$Player.position.y = 487


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scenes()
	if skelly_talk and Input.is_action_just_pressed("interact"):
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/skelly_dead.dialogue"))


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true
	

func change_scenes():
	if global.transition_scene:
		global.prev_scene = "forest_lvl"
		get_tree().change_scene_to_file("res://main.tscn")
		global.transition_scene = false
	if forest_level_transition:
		get_tree().change_scene_to_file("res://scenes/forest2d.tscn")
		forest_level_transition = false

func _on_area_2d_body_exited(body):
	global.transition_scene = false


func _on_area_2d_area_entered(area):
	print("entered")
	skelly_talk = true


func _on_area_2d_area_exited(area):
	skelly_talk = false


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		forest_level_transition = true
