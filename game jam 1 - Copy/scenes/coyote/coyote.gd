extends CharacterBody2D
var player_chase = false
var player = null
var speed = 50
@onready var death_sound = $deathsound
func _physics_process(delta):
	if player_chase:
		position += (player.position - position)/speed
		if(player.position.y - position.y) > 0:
			$AnimatedSprite2D.play("front_walk")
		elif((player.position.y - position.y) < 0):
			$AnimatedSprite2D.play("back_walk")
		
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
			
		else:
			$AnimatedSprite2D.flip_h = false
			
	else:
		$AnimatedSprite2D.play("front_idle")
	move_and_collide(Vector2(0,0))
	
func enemy():
	pass

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true



func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
func die():
	death_sound.play()
	queue_free()
