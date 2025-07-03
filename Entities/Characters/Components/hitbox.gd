extends Area2D
class_name Hitbox

@export var health: Health

signal knocked_back(params: Array)

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	if area is Hurtbox and health:
		health.damage(area.damage)
		knocked_back.emit([area.knockback_origin.position, area.knockback_strength,
		area.knockback_duration])
