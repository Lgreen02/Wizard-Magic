extends CharacterBody2D

class_name Enemy

@export var speed = Vector2(50.0, 350.0)
@onready var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

const FLOOR_NORMAL = Vector2.UP

var _velocity = Vector2.ZERO
var playerDamage : bool = false

@onready var platform_detector = $PlatformDetector
@onready var floor_detector_left = $FloorDetectorLeft
@onready var floor_detector_right = $FloorDetectorRight
@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var state_machine: CharacterStateMachine = $CharacterStateMachine

@onready var detectionRight = $DetectionRight/CollisionShape2D
@onready var detectArea = $DetectionRight
@onready var detectionLeft = $DetectionLeft/CollisionShape2D

var hitbox: CollisionShape2D
var facing_player: bool = false

signal enemy_hit(damage: int)
signal facing_direction_changed(facing_right: bool)


func _ready():
	animation_tree.active = true
	_velocity.x = speed.x

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		_velocity.y += gravity * delta

	if not floor_detector_left.is_colliding():
		_velocity.x = speed.x
	elif not floor_detector_right.is_colliding():
		_velocity.x = -speed.x

	if is_on_wall():
		_velocity.x *= -1

	set_velocity(_velocity)
	set_up_direction(FLOOR_NORMAL)
	if state_machine.check_if_can_move():
		move_and_slide()
	update_facing_direction()
	_velocity.y = velocity.y

func update_facing_direction():
	if _velocity.x > 0:
		global.facing_right = true
#		print(global.facing_right)
		sprite.scale.x = 1
	else:
		global.facing_right = false
#		print(global.facing_right)
		sprite.scale.x = -1
	emit_signal("facing_direction_changed", !sprite.flip_h)

var playerInsideHurtbox = false

func hit():
	print("hit function entered")
	print(global.player_health)
	$HitboxLeft.monitoring = true
	$HitboxRight.monitoring = true
	if(playerInsideHurtbox):
		global.player_health -=15
#		emit_signal("enemy_hit", 15)
	print("current Health:")
	print(global.player_health)

func end_of_hit():
	$HitboxLeft.monitoring = false
	$HitboxRight.monitoring = false


func _on_hitbox_left_body_entered(body: Node2D) -> void:
	print("left hitbox entered")
	if body is Player:
		playerInsideHurtbox = true
		hit()


func _on_hitbox_left_body_exited(body: Node2D) -> void:
	print("hitbox exited")
	if body is Player:
		playerInsideHurtbox = false


func _on_hitbox_right_body_entered(body: Node2D) -> void:
	print("right hitbox entered")
	if body is Player:
		playerInsideHurtbox = true
		hit()


func _on_hitbox_right_body_exited(body: Node2D) -> void:
	print("hitbox exited")
	if body is Player:
		playerInsideHurtbox = false
