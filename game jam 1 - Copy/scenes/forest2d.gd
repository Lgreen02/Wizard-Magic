extends Node

var can_tp = false

func _physics_process(delta: float) -> void:
	if can_tp == true && Input.is_action_just_pressed("interact"):
		global.forest_burned_down = true
		get_tree().change_scene_to_file("res://scenes/forest_lvl_dead.tscn")

func _on_transition_body_entered(body: Node2D) -> void:
	print("is inside to tp")
	can_tp = true
	
