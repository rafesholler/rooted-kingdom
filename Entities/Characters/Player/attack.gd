extends State

func on_start(params: Array = []) -> void:
	$Hurtbox.visible = true
	$Timer.start(.5)
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	target.velocity.y = move_toward(target.velocity.y, 500, target.GRAVITY * delta)
	target.move_and_slide()
	
	var dir = Input.get_axis("move_left", "move_right")
	target.velocity.x = target.speed * dir
	
	if Input.is_action_pressed("jump") and target.is_on_floor():
		finished.emit(get_neighbor("Jump"))

func on_end() -> void:
	pass


func _on_timer_timeout() -> void:
	$Hurtbox.visible = false
	var dir = Input.get_axis("move_left", "move_right")
	
	if target.is_on_floor:
		if dir == 0:
			finished.emit(get_neighbor("Idle"))
		else:
			finished.emit(get_neighbor("Run"))
	else:
		finished.emit(get_neighbor("Fall"))
