extends Area2D
class_name HitboxComponent

@export var health_component: HealthComponent


func _on_area_entered(area: Area2D) -> void:
	if area is HurtboxComponent and health_component:
		health_component.damage(area.damage)
