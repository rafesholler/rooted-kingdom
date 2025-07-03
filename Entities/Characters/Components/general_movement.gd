extends Node2D
class_name GeneralMovement

@export var body: PhysicsBody2D

@export var speed: float = 150
@export var acceleration: float = 800
@export var friction: float = 800
@export var gravity_mod: float = 1

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func stop_with_friction(delta: float) -> void:
	body.velocity.x = move_toward(body.velocity.x, 0, friction * delta)


func hard_stop() -> void:
	body.velocity.x = 0


func freeze() -> void:
	body.velocity = Vector2.ZERO


func basic_chase_grounded(delta: float, target: PhysicsBody2D) -> void:
	if target.position.x < body.position.x:
		body.velocity.x = move_toward(body.velocity.x, -speed, acceleration * delta)
	else:
		body.velocity.x = move_toward(body.velocity.x, speed, acceleration * delta)


func fall(delta: float) -> void:
	body.velocity.y = move_toward(body.velocity.y, 500 * gravity_mod, gravity * gravity_mod * delta)
