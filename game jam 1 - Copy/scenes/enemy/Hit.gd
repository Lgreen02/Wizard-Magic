extends State

class_name HitState
@export var damageable : Damageable
@export var dead_state: State
@export var walk_state: State
@export var dead_animation_node: String = "death"
@export var knockback_velocity : Vector2 = Vector2(100,0)
@export var return_state : State
@export var return_animation_node : String = "walk"

@export var hit_animation_node : String = "hit"

@onready var timer : Timer = $Timer

func _ready():
	damageable.connect("on_hit", on_damageable_hit)

func on_enter():
	timer.start()

func on_damageable_hit(node: Node, damage_amount : int):
	if(damageable.health > 0):
		playback.travel(hit_animation_node)
		emit_signal("interrupt_state", self)
	else:
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)

func _on_timer_timeout() -> void:
	next_state = return_state
	playback.travel(return_animation_node)
