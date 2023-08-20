extends Node2D

@export var player : Player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_fall_box_body_entered(body):
	print("fall box")
	if body.has_method("player"):
		print("player in fall box")
		player.position.x = 33
		player.position.y = 375


func _on_transition_box_body_entered(body):
	if body.has_method("player"):
		global.prev_scene = "desert2D"
		get_tree().change_scene_to_file("res://scenes/desert_lvl/desert_lvl.tscn")
