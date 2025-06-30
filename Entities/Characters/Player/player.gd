extends CharacterBody2D

var GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")

var can_jump = true

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y = move_toward(velocity.y, 500, GRAVITY * delta)
	else:
		can_jump = true
		velocity.y = 0

	if Input.is_action_pressed("jump") and can_jump:
		velocity.y = -200
		if is_on_floor():
			$JumpHoldTimer.start(.3)
	
	velocity.x = Input.get_axis("move_left", "move_right") * 300
	
	if Input.is_action_just_released("jump") and not is_on_floor():
		can_jump = false
	
	move_and_slide()


func _on_jump_hold_timer_timeout() -> void:
	if not is_on_floor():
		can_jump = false
