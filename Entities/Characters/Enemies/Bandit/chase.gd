extends State

var attack_ready := false

func on_start(params: Array = []) -> void:
	$AttackTimer.run()
	attack_ready = false
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	if not target.player:
		finished.emit(get_neighbor("Idle"))
		return
	
	target.movement.basic_chase_grounded(delta, target.player)
	target.movement.fall(delta)
	target.move_and_slide()
	
	if (target.player.position - target.position).length() < 20 and attack_ready:
		finished.emit(get_neighbor("Attack"))

func on_end() -> void:
	$AttackTimer.stop()


func _on_attack_timer_timeout() -> void:
	attack_ready = true
