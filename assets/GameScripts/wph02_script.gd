extends Area2D

var count = 0

func _ready():
	print("WPH02")
	connect("input_event", self, "_on_ObjectTemplate_input_event")

func _on_ObjectTemplate_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				print("[WPH02] Left button was clicked at ", event.position)
			else:
				print("[WPH02] Left button was released")
		if event.button_index == BUTTON_WHEEL_DOWN:
			print("[WPH02] Wheel down")
