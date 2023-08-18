extends CharacterBody2D

const GRAVITY = 10;
const SPEED = 30;
const FLOOR = Vector2(0, -1)

var evelocity = Vector2()

func _ready():
	pass

func _physics_process(delta: float) -> void:
	evelocity.x = SPEED
	$AnimatedSprite2D.play("walk")
	evelocity.y += GRAVITY
	
	evelocity = move_and_slide()
	
