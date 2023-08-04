extends Node

var transition_scene = false
var prev_scene = "none"
var current_dir = "right"
var double_jump = true
var talked_to_master = false
var talked_to_hunter = false
var in_range = false
var mother_tree = false


var player_health = 100
var player_xp = 0
signal global_variable_changed(new_value)

func update_global_variable(new_value):
	player_xp = new_value
	emit_signal("global_variable_changed", player_xp)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
