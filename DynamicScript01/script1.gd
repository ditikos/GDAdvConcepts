extends Node

onready var MessageLabel = get_tree().get_root().find_node("MessageLabel", true, false)
onready var CommandButtons = get_tree().get_root().find_node("VerbContainer", true, false)

const allowBtns = ["WalkToBtn", "OpenBtn", "CloseBtn"]


func _ready():
	connect("mouse_entered", self, "_on_Script01_mouse_entered")
	connect("mouse_exited", self, "_on_Script01_mouse_exited")
	connect("input_event", self, "_on_Script01_input_event")

func _on_Script01_mouse_entered():
	MessageLabel.text = "Script 01 Mouse Entered"
	for btn in CommandButtons.get_children():
		if btn is Button:
			if btn.name in allowBtns:
				print("%s is allowed" % [btn.name])
				btn.set("custom_colors/font_color",Color(1, 1, 1))
#				get_tree().get_root().find_node(btn.name).add_color_override("font_color", Color(1,0,0,1))
			else:
				print("%s is not allowed" % [btn.name])
				btn.set("custom_colors/font_color",Color(0.75, 0.75, 0.75, 1))


func _on_Script01_mouse_exited():
	MessageLabel.text = "Script 01 Mouse Exited"
	for btn in CommandButtons.get_children():
		btn.set("custom_colors/font_color", Color(1,1,1))

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
