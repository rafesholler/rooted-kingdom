extends State

func on_start(params: Array = []) -> void:
	target.velocity.x = 0
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	target.movement.fall(delta)
	target.move_and_slide()
	
	if target.player:
		finished.emit(get_neighbor("Chase"))

func on_end() -> void:
	pass


func _on_detection_range_body_entered(body: Node2D) -> void:
	if body is Player:
		target.player = body
		finished.emit(get_neighbor("Chase"))


func _on_detection_range_body_exited(body: Node2D) -> void:
	if body is Player:
		target.player = null
