extends CharacterBody2D

@export var movement: GeneralMovement

var player: Player

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	$Label.text = $StateMachine.states[$StateMachine.curr].name


func _on_detection_range_body_entered(body: Node2D) -> void:
	if body is not Player:
		return
	player = body


func _on_health_damage_taken(old: float, new: float) -> void:
	var dmg = old - new
	print("OW! I took " + str(dmg) + " damage!")


func _on_hitbox_knocked_back(params: Array) -> void:
	$StateMachine.force_state("KnockedBack", params)
