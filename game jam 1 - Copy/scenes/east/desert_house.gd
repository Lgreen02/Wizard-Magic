extends Node2D

var sign_read = false
var read_book = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$cactus/cactus.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if read_book and Input.is_action_just_pressed("interact"):
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/magic_muscles.dialogue"))
		global.can_push = true
	if sign_read and Input.is_action_just_pressed("interact"):
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/cactus_desert.dialogue"))
		
		return


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		global.prev_scene = "desert_house"
		get_tree().change_scene_to_file("res://scenes/east/east.tscn")


func _on_cactus_interaction_area_entered(area):
	sign_read = true


func _on_cactus_interaction_area_exited(area):
	sign_read = false


func _on_book_body_entered(body):
	read_book = true


func _on_book_body_exited(body):
	read_book = false
