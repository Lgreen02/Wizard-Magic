extends AnimatableBody2D
var distance = Vector2.ZERO
var death_time = 0
var direction = "none"
# Called when the node enters the scene tree for the first time.
func _ready():
	death_time = Time.get_ticks_msec() + 2000
	direction = global.current_dir

func fireball():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Time.get_ticks_msec() >= death_time:
		queue_free()

func _physics_process(delta):

	if direction == "right":
		distance = Vector2.RIGHT * 100 * delta
	elif direction == "left":
		distance = Vector2.LEFT * 100 * delta
	elif direction == "up":
		distance = Vector2.UP * 100 * delta
	elif direction == "down":
		distance = Vector2.DOWN * 100 * delta
	$AnimatedSprite2D.play("idle")
	var collision = move_and_collide(distance)
	
	if collision:
		$AnimatedSprite2D.play("hit")
		if collision.get_collider().has_method("tree"):
			collision.get_collider().queue_free()
		queue_free()
		if collision.get_collider().has_method("enemy"):
			collision.get_collider().die()
	
