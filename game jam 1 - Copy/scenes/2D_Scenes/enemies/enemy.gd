extends CharacterBody2D


@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var sprite: Sprite2D = $Sprite2D

@export var starting_move_direction : Vector2 = Vector2.LEFT
@export var movement_speed : float = 30.0
@export var hit_state : State

@export var flip_node : Node2D

var direction : Vector2 = starting_move_direction

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation_tree.active = true
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	move_and_slide()

func update_animation_parameters():
	animation_tree.set("parameters/move/blend_position", direction.x)




func _on_detection_body_entered(body: Node2D) -> void:
	print("Enter Enemey")
#	if direction && state_machine.check_if_can_move():
#		velocity.x = direction.x * movement_speed
#	elif state_machine.current_state != hit_state:
#		velocity.x = move_toward(velocity.x, 0, movement_speed)
	pass # Replace with function body.


func _on_detection_body_exited(body: Node2D) -> void:
	print("Exit Enemy")
	
	pass # Replace with function body.
