extends State

class_name WalkState

@export var damageable : Damageable
@export var attack_node : String = "attack1"
@export var attack_state : State

func _on_right_detection_body_entered(body: Node2D) -> void:
	print("entered right body")
	if global.facing_right: 
		next_state = attack_state


func _on_left_detection_body_entered(body: Node2D) -> void:
	print("entered left body")
	if !global.facing_right: 
		next_state = attack_state
