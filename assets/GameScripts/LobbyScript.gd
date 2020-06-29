extends Area2D

var count = 0

#func _input(event: InputEvent) -> void:
#	if event is InputEventMouseButton:
#		if event.pressed:
#			count += 1
#			print("Click:" + str(count))
	
func _ready():
	print("=======> Added script?")
	print("Connecting event")
	connect("input_event", self, "_on_ObjectTemplate_input_event")

func _on_ObjectTemplate_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				print("Left button was clicked at ", event.position)
			else:
				print("Left button was released")
		if event.button_index == BUTTON_WHEEL_DOWN:
			print("Wheel down")
