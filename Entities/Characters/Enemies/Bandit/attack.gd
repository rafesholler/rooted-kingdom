extends State

func on_start(params: Array = []) -> void:
	target.velocity.x = 0
	$Hurtbox.visible = true
	$Timer.start(.5)
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	target.movement.fall(delta)
	target.move_and_slide()

func on_end() -> void:
	$Hurtbox.visible = false


func _on_timer_timeout() -> void:
	finished.emit(get_neighbor("Chase"))
