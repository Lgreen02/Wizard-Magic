extends Node2D


func _on_fall_box_body_entered(body):
	if body.has_method("player"):
		print("fall box")
		$Player.position.x = 226
		$Player.position.y = 291


func _on_transition_box_body_entered(body):
	if body.has_method("player"):
		get_tree().change_scene_to_file("res://scenes/center/center.tscn")
