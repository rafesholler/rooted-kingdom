extends State

func on_start(params: Array = []) -> void:
	$Timer.start(params[2])
	target.velocity = (target.position - params[0]).normalized() * params[1]
	print(target.velocity)
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	target.movement.fall(delta)
	
	target.move_and_slide()

func on_end() -> void:
	pass


func _on_timer_timeout() -> void:
	finished.emit(get_neighbor("Chase"))
