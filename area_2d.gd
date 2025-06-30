extends Area2D

var completed = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and not completed:
		$CanvasLayer/DialogueBox.visible = true


func _on_dialogue_box_completed() -> void:
	$CanvasLayer/DialogueBox.visible = false
	completed = true
