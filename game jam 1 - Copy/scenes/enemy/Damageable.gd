extends Node

class_name Damageable

signal on_hit(node : Node, damage_taken : int)

@export var health : float = 20
@export var dead_animation_name : String = "death"

func hit(damage : int):
	health -= damage
	
	emit_signal("on_hit", get_parent(), damage)
	
	if(health <= 0):
		print("dead enemy")


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if(anim_name == dead_animation_name):
		get_parent().queue_free()
