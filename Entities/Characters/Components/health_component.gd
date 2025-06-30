extends Node2D
class_name HealthComponent

signal damage_taken(old: float, new: float)
signal killed

@export var max_health: float = 10
@export var health: float = 10
@export var immune := false


func damage(amount) -> void:
	if immune and amount >= 0:
		return
	
	var old_health := health
	health -= amount
	if health <= 0:
		killed.emit()
	if health > max_health:
		health = max_health
	damage_taken.emit(old_health, health)
