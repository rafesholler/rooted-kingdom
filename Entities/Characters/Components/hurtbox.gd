extends Area2D
class_name Hurtbox

@export var damage: float = 5
@export var knockback_strength := 150.0
@export var knockback_origin: Node2D = self
@export var knockback_duration := .3

var collider: CollisionShape2D

func _ready() -> void:
	for node in get_children():
		if node is CollisionShape2D:
			collider = node


func _physics_process(delta: float) -> void:
	if collider:
		collider.disabled = not visible
