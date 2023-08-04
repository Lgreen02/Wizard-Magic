extends Node2D
var skelly_talk = false
var elly_talk = false
var letonne_talk = false
var bonny_talk = false
var trey_talk = false
var sign_read = false
var has_bonny = false
var has_elly = false
var has_letonne = false
var has_skelly = false
var has_trey = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_dialogue()
func handle_dialogue():
	if global.interacting and Input.is_action_just_pressed("interact"):
		if skelly_talk:
			has_skelly = true
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/skelly_d.dialogue"))
		elif elly_talk:
			if has_skelly and has_bonny:
				has_elly = true
			else:
				has_skelly = false
				has_bonny = false
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/elly_d.dialogue"))
		elif letonne_talk:
			if has_skelly and has_bonny and has_trey and has_elly:
				has_letonne = true
				global.can_fireball = true
			else:
				has_skelly = false
				has_bonny = false
				has_trey = false
				has_elly = false
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/letonne_d.dialogue"))
			
		elif bonny_talk:
			if has_skelly:
				has_bonny = true
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/bonny_d.dialogue"))
		elif trey_talk:
			if has_skelly and has_bonny:
				has_trey = true
			else:
				has_skelly = false
				has_bonny = false
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/trey_d.dialogue"))
		elif sign_read:
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/sign_d.dialogue"))
func _on_skelly_body_area_entered(area):
	skelly_talk = true


func _on_skelly_body_area_exited(area):
	skelly_talk = false


func _on_elly_body_area_entered(area):
	elly_talk = true


func _on_elly_body_area_exited(area):
	elly_talk = false


func _on_letonne_body_area_entered(area):
	letonne_talk = true


func _on_letonne_body_area_exited(area):
	letonne_talk = false

func _on_bonny_body_area_entered(area):
	bonny_talk = true


func _on_bonny_body_area_exited(area):
	bonny_talk = false
func _on_trey_body_area_entered(area):
	trey_talk = true

func _on_trey_body_area_exited(area):
	trey_talk = false


func _on_sign_body_area_entered(area):
	print("entered")
	sign_read = true


func _on_sign_body_area_exited(area):
	sign_read = false


func _on_outside_body_entered(body):
	if body.has_method("player"):
		global.prev_scene = "cave"
		get_tree().change_scene_to_file("res://main.tscn")

