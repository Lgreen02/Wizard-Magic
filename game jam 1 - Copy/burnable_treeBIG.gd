extends StaticBody2D

var is_burnt = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_burnt:
		queue_free()

func tree():
	pass

func _on_area_2d_body_entered(body):
	if body.has_method("cast"):
		is_burnt = true
		global.player_xp += 1
