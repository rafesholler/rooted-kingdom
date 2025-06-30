extends CharacterBody2D

var going_out := true

@export var half_time := .1
@export var speed := 100

var default_position: Vector2

func _ready() -> void:
	default_position = position

func _physics_process(delta: float) -> void:
	if not visible:
		var mouse_pos = get_global_mouse_position() - global_position
		rotation = Vector2(1, 0).angle_to(mouse_pos)
		position = default_position
	
	if Input.is_action_just_pressed("attack") and not visible:
		$Timer.start(half_time)
		visible = true
		going_out = true
		
		velocity.x = speed
		velocity = velocity.rotated(rotation)
			
	move_and_slide()

func _on_timer_timeout() -> void:
	if going_out:
		$Timer.start(half_time)
		going_out = false
		
		velocity = Vector2(-speed, 0)
		velocity = velocity.rotated(rotation)
	else:
		visible = false
		$Timer.stop()
		velocity = Vector2.ZERO
