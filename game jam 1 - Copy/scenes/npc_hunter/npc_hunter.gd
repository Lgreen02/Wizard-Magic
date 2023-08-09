extends CharacterBody2D

@onready var animation_tree : AnimationTree = $AnimationTree

var hunter_location : String = "res://dialogue2d/hunter.dialogue"
var hunter_talk = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation_tree.active = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if hunter_talk == true && Input.is_action_just_pressed("interact"):
		DialogueManager.show_example_dialogue_balloon(load(hunter_location), "start")

func interact():
	pass


func _on_hunter_detection_area_entered(area: Area2D) -> void:
	print("mother tree is")
	print(global.mother_tree)
	print("hunter area entered")
	hunter_talk = true


func _on_hunter_detection_area_exited(area: Area2D) -> void:
	print("hunter area exited")
	pass # Replace with function body.
