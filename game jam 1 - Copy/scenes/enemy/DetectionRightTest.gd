extends Area2D

@export var enemyTEST : Enemy
@export var facing_shape : FacingCollisonShape2DEnemyTEST

func _ready():
	monitoring = false
	enemyTEST.connect("facing_direction_changedTEST", _on_player_facing_direction_changed)

func _on_body_entered(body: Node2D) -> void:
	for child in body.get_children():
		print(body.name)

func _on_player_facing_direction_changed(facing_right : bool):
	if(facing_right):
		facing_shape.position = facing_shape.facing_right_position
	else:
		facing_shape.position = facing_shape.facing_left_position
