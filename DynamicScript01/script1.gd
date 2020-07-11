extends Node

onready var MessageLabel = get_tree().get_root().find_node("MessageLabel", true, false)
const can_press = 0b100110000

func _ready():
	connect("mouse_entered", self, "_on_Script01_mouse_entered")
	connect("mouse_exited", self, "_on_Script01_mouse_exited")
	connect("input_event", self, "_on_Script01_input_event")

func _on_Script01_mouse_entered():
	MessageLabel.text = "Script 01 Mouse Entered"

func _on_Script01_mouse_exited():
	MessageLabel.text = "Script 01 Mouse Exited"

func enable_buttons():
	pass

func _on_Script01_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				print("[WPH01] Left button was clicked at ", event.position)
			else:
				print("[WPH01] Left button was released")
		if event.button_index == BUTTON_WHEEL_DOWN:
			print("[WPH01] Wheel down")
