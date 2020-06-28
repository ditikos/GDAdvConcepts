extends Area2D

var count = 0

#func _input(event: InputEvent) -> void:
#	if event is InputEventMouseButton:
#		if event.pressed:
#			count += 1
#			print("Click:" + str(count))
	
func _ready():
	connect("input_event", self, "_on_area_clicked")
	
func _on_area_clicked(event):
	if event is InputEventMouseButton and event.pressed:
		print("clicked on area")
