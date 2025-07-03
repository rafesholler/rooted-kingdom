extends State

func on_start(params: Array = []) -> void:
	$JumpHoldTimer.start(.3)
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	if Input.is_action_pressed("jump") and not $JumpHoldTimer.is_stopped():
		target.velocity.y = -200
	
	if not Input.is_action_pressed("jump"):
		$JumpHoldTimer.stop()
		finished.emit(get_neighbor("Fall"))
	
	var dir = Input.get_axis("move_left", "move_right")
	target.velocity.x = target.speed * dir
	
	target.velocity.y = move_toward(target.velocity.y, 500, target.GRAVITY * delta)
		
	if Input.is_action_pressed("attack"):
		finished.emit(get_neighbor("Attack"))
	
	target.move_and_slide()

func on_end() -> void:
	$JumpHoldTimer.stop()


func _on_jump_hold_timer_timeout() -> void:
	finished.emit(get_neighbor("Fall"))
