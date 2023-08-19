extends Node2D





func _on_fall_box_body_entered(body):
	if body.has_method("player"):
		print("fall box")
		$Player.position.x = 7564
		$Player.position.y = 367
