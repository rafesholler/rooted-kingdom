extends State

func on_start(params: Array = []) -> void:
	pass
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	var dir = Input.get_axis("move_left", "move_right")
	target.velocity.x = target.speed * dir
	
	target.move_and_slide()
	
	if not target.is_on_floor():
		# To fall state
		finished.emit(get_neighbor("Fall"))
	
	elif dir == 0:
		# To idle state
		finished.emit(get_neighbor("Idle"))
	
	elif Input.is_action_pressed("jump"):
		# To jump state
		finished.emit(get_neighbor("Jump"))
	
	if Input.is_action_pressed("attack"):
		finished.emit(get_neighbor("Attack"))

func on_end() -> void:
	pass
