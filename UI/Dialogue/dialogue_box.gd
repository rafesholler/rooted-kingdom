extends Control

signal completed

@onready var textbox := $VBoxContainer/DialogueBoxMain/RichTextLabel
@onready var dialogue_chain := $DialogueChain
@onready var player_options := $VBoxContainer/PlayerOptions
var chain_index := 0
var frame_count := 0

func _ready() -> void:
	textbox.visible_characters = 0
	textbox.text = dialogue_chain.get_children()[0].text
	

func _process(delta: float) -> void:
	frame_count += 1
	if frame_count % 3 == 0 and textbox.visible_characters != -1:
		textbox.visible_characters += 1
	
	#print(textbox.visible_ratio)
	
	if Input.is_action_just_pressed("interact"):
		if textbox.visible_ratio < 1:
			textbox.visible_ratio = 1
			print(textbox.visible_characters)
		else:
			_get_next_text()


func _get_next_text() -> void:
	textbox.visible_characters = 0
	chain_index += 1
	
	if chain_index >= dialogue_chain.get_children().size():
		completed.emit()
		return
	
	var next = dialogue_chain.get_children()[chain_index]
	
	if next is DialogueSection:
		for option in player_options.get_children():
			option.call_deferred("queue_free")
		textbox.text = next.text
	elif next is DialogueChoice:
		for option in next.options:
			_generate_option(option)


func _generate_option(text: String) -> void:
	var panel = PanelContainer.new()
	panel.custom_minimum_size = Vector2(100, 35)
	panel.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	
	var label = RichTextLabel.new()
	label.text = text
	
	panel.add_child(label)
	player_options.add_child(panel)
