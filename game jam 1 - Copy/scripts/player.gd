extends CharacterBody2D

var current_dir = "none"
const speed = 100
var attack_ip = false
var sign_in_range = false
var can_attack = true
@onready var projectile_position_up = $projectile_position_up
@onready var projectile_position_down = $projectile_position_down
@onready var projectile_position_right = $projectile_position_right
@onready var projectile_position_left = $projectile_position_left
@onready var game = get_tree().current_scene

var current_dialogue = "none"
var fireball =  preload("res://scenes/fireball.tscn")

func _ready():
	$AnimatedSprite2D.play("idle")
func _physics_process(delta):
	
	player_movement(delta)
	#if sign_in_range:
	#	if Input.is_action_just_pressed("interact"):
	#		DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"))
	
func player_movement(delta):
	if Input.is_action_just_pressed("cast") and can_attack:
		can_attack = false
		shoot_fireball()
	if Input.is_action_pressed("right"):
		global.current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("left"):
		global.current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("down"):
		play_anim(1)
		global.current_dir = "down"
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("up"):
		play_anim(1)
		global.current_dir = "up"
		velocity.x = 0
		velocity.y = -speed
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	move_and_slide()
func _input(event):
	if event.is_action_pressed("cast") and can_attack:
		attack_ip = true
		$fireball_cooldown.start()
		var projectile_instance = fireball.instantiate()
		if global.current_dir == "up":
			projectile_instance.position = projectile_position_up.global_position
		if global.current_dir == "down":
			projectile_instance.position = projectile_position_down.global_position
		if global.current_dir == "right":
			projectile_instance.position = projectile_position_right.global_position
		if global.current_dir == "left":
			projectile_instance.position = projectile_position_left.global_position
		game.add_child(projectile_instance)
		
func play_anim(movement):
	var dir = global.current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if !attack_ip:
			if movement == 1:
				anim.play("walk")
			elif movement == 0:
				anim.play("idle")
	if dir == "left":
		anim.flip_h = true
		if !attack_ip:
			if movement == 1:
				anim.play("walk")
			elif movement == 0:
				anim.play("idle")
	if dir == "down" or dir == "up":
		if !attack_ip:
			if movement == 1:
				anim.play("walk")
			elif movement == 0:
				anim.play("idle")
func shoot_fireball():
	$AnimatedSprite2D.play("attack")
	print("SHOOT")
func player():
	pass
	


func handle_dialogue():
	pass

func _on_fireball_cooldown_timeout():
	$fireball_cooldown.stop()
	can_attack = true
	attack_ip = false


func _on_interaction_area_body_entered(body):
	current_dialogue = body
	#print(body)
	
	global.interacting = true
	if body.has_method("signs"):
		sign_in_range = true
	#print(sign_in_range)


func _on_interaction_area_body_exited(body):
	current_dialogue = null
	global.interacting = false
	if body.has_method("signs"):
		sign_in_range = false
