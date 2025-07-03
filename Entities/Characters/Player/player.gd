extends CharacterBody2D
class_name Player

@export var speed := 300
@export var jump_force := -200
@export var max_fall_speed := 500

var GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	$Label.text = $StateMachine.states[$StateMachine.curr].name

func _physics_process(delta: float) -> void:
	pass
