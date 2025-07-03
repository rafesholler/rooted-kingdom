extends State

func on_start(params: Array = []) -> void:
	target.velocity.x = 0
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	target.velocity.y = move_toward(
		target.velocity.y, target.max_fall_speed, target.GRAVITY * delta)
	target.move_and_slide()
	
	if not target.is_on_floor():
		# To fall state
		finished.emit(get_neighbor("Fall"))
	
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		# To run state
		finished.emit(get_neighbor("Run"))
	
	elif Input.is_action_pressed("jump"):
		# To jump state
		finished.emit(get_neighbor("Jump"))
		
	elif Input.is_action_pressed("attack"):
		finished.emit(get_neighbor("Attack"))

func on_end() -> void:
	pass
