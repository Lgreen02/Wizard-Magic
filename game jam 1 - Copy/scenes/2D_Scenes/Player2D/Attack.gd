extends State

@export var return_state : State
@export var return_animation_node : String = "move"
@export var attack1_name : String = "attack1"
@export var attack2_name : String  = "attack2"
@export var attack3_name : String = "fireball"
@export var attack_air : String = "attack_air"
@export var attack2_node : String = "attack2"


func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == attack1_name):
#		if(timer.is_stopped()):
			next_state = return_state
			playback.travel(return_animation_node)
#		else: 
#			playback.travel(attack2_node)
		
	if(anim_name == attack2_name):
		next_state = return_state
		playback.travel(return_animation_node)
	
	if(anim_name == attack3_name):
		next_state = return_state
		playback.travel(return_animation_node)
	
	if(anim_name == attack_air):
		next_state = return_state
		playback.travel(return_animation_node)
