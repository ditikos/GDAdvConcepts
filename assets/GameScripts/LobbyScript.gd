extends Area2D

var count = 0

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			count += 1
			print("Click:" + str(count))
