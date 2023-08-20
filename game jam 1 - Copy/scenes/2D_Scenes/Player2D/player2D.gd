extends CharacterBody2D

class_name Player

@export var speed : float = 200.0

var fireball =  preload("res://scenes/fireballs/fireball2d.tscn")
@onready var game = get_tree().current_scene

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction: Vector2 = Vector2.ZERO
var npc_in_range = false
var end_stage = false

signal facing_direction_changed(facing_right : bool)

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_tree: AnimationTree = $AnimationTree
#@onready var state_machine: CharacterStateMachinePlayer = $CharacterStateMachine
@export var state_machine: CharacterStateMachinePlayer
@onready var attack_state : State = $CharacterStateMachine/Attack

@onready var timer : Timer = $FBallTimer

@onready var projectile_position_right = $right
@onready var projectile_position_left = $left


func _ready():
	global.setGlobalValue(100)
	animation_tree.active = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	
	direction = Input.get_vector("left", "right", "up", "down")
	if direction == Vector2.RIGHT:
		global.current_dir = "right"
	if direction == Vector2.LEFT:
		global.current_dir = "left"
	
	if direction.x != 0 && state_machine.check_if_can_move():
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	if npc_in_range == true:
		if Input.is_action_just_pressed("interact"):
			print("Interact button worked for NPC")
	if end_stage == true:
		if Input.is_action_just_pressed("interact"):
			print("Interact button worked for Ending")
	
	move_and_slide()
	update_animation_parameters()
	update_facing_direction()

func _input(event):
	if(state_machine.current_state == attack_state):
		pass
	else:
		if event.is_action_pressed("cast") && is_on_floor():
			timer.start()
#		_on_f_ball_timer_timeout()
#		var projectile_instance = fireball.instantiate()
#		if global.current_dir == "right":
#			projectile_instance.position = projectile_position_right.global_position
#		if global.current_dir == "left":
#			projectile_instance.position = projectile_position_left.global_position
#		game.add_child(projectile_instance)

func update_animation_parameters():
	animation_tree.set("parameters/move/blend_position", direction.x)

func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true
	emit_signal("facing_direction_changed", !sprite.flip_h)


func _on_detection_area_body_entered(body):
	if body.has_method("interact"):
		print("in range worked")
		npc_in_range = true
		global.in_range = true
	if body.has_method("ending"):
		print("in range to end")
		end_stage = true


func _on_detection_area_body_exited(body):
	if body.has_method("interact"):
		print("not in range")
		npc_in_range = false
		global.in_range = false


func _on_f_ball_timer_timeout() -> void:
	print("Fball Timer end")
	var projectile_instance = fireball.instantiate()
	if global.current_dir == "right":
		projectile_instance.position = projectile_position_right.global_position
	if global.current_dir == "left":
		projectile_instance.position = projectile_position_left.global_position
	game.add_child(projectile_instance)

func player():
	pass
