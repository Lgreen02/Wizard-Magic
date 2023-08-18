extends State

class_name AttackState

@export var return_state : State
@export var return_animation_node : String = "walk"
@export var attack1_name : String = "attack1"
@export var attack_node : String = "attack1"

@onready var timer : Timer = $Timer
var timerOff : bool = false

func _ready() -> void:
	timer.start()

func on_enter():
	playback.travel(attack_node)

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == attack1_name):
			next_state = return_state
			playback.travel(return_animation_node)
