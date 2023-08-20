extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_fall_box_body_entered(body):
	print("fall box entered")
	if body.has_method("player"):
		print("fall box")
		$Player.position.x = 71
		$Player.position.y = -68



func _on_transition_box_body_entered(body):
	if body.has_method("player"):
		get_tree().change_scene_to_file("res://scenes/ice_lvl/ice_lvl.tscn")
		global.prev_scene = "ice2D"
