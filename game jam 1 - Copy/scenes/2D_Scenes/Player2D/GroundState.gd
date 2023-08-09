extends State

class_name GroundState

@export var jump_velocity: float = -200.0
@export var air_state : State
@export var jump_animation : String = "jump"
@export var attack_state : State
@export var attack_node : String = "attack1"
@export var fireball_node : String = "fireball"

@onready var buffer_timer : Timer = $BufferTimer

func state_process(delta):
	if(!character.is_on_floor() && buffer_timer.is_stopped()):
		next_state = air_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()
	if(event.is_action_pressed("attack")):
		attack()
	if(event.is_action_pressed("cast")):
		print(global.player_xp)
		fireball()

func fireball():
	next_state = attack_state
	playback.travel(fireball_node)

func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation)

func attack():
	next_state = attack_state
	playback.travel(attack_node)
