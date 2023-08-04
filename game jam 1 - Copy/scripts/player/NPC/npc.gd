extends CharacterBody2D

@onready var animation_tree : AnimationTree = $AnimationTree

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var master_location : String = "res://master.dialogue"
var master_talk = false

func _ready():
	animation_tree.active = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if master_talk == true && Input.is_action_just_pressed("interact"):
		DialogueManager.show_example_dialogue_balloon(load(master_location), "start")

func interact():
	pass


func _on_master_detection_area_entered(area: Area2D) -> void:
	print("master area entered")
	master_talk = true


func _on_master_detection_area_exited(area: Area2D) -> void:
	print("master area exited")
	master_talk = false
