extends CharacterBody2D

var distance = Vector2.ZERO
var move_left = false
var move_right = false
var move_up = false
var move_down = false

func _physics_process(delta):
	if global.can_push:
		if move_right:
			distance = Vector2.RIGHT * 0.75
		if move_left:
			distance = Vector2.LEFT * 0.75
		if !move_left and !move_right:
			distance = Vector2.ZERO
		if move_down:
			distance = Vector2.ZERO
		
		
		move_and_collide(distance)

func _on_right_body_entered(body):
	if body.has_method("player") and !move_right:
		print("move left")
		move_left = true


func _on_left_body_entered(body):
	if body.has_method("player") and !move_left:
		move_right = true


func _on_right_body_exited(body):
	if body.has_method("player"):
		move_left = false


func _on_left_body_exited(body):
	if body.has_method("player"):
		move_right = false


func _on_down_body_entered(body):
	if body.has_method("player"):
		move_up = true
		print("move up")


func _on_down_body_exited(body):
	if body.has_method("player"):
		move_up = false


func _on_up_body_entered(body):
	if body.has_method("player"):
		move_down = true


func _on_up_body_exited(body):
	if body.has_method("player"):
		move_down = false
