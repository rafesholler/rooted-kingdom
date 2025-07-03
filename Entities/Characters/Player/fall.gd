extends State

func on_start(params: Array = []) -> void:
	pass
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	target.velocity.y = move_toward(target.velocity.y, 500, target.GRAVITY * delta)
	target.move_and_slide()
	
	var dir = Input.get_axis("move_left", "move_right")
	if dir == 0:
		target.velocity.x = move_toward(target.velocity.x, 0, 800 * delta)
	else:
		target.velocity.x = target.speed * dir
	
	if target.is_on_floor():
		if dir == 0:
			# To idle state
			finished.emit(get_neighbor("Idle"))
		else:
			finished.emit(get_neighbor("Run"))
	
	if Input.is_action_pressed("attack"):
		finished.emit(get_neighbor("Attack"))

func on_end() -> void:
	pass
