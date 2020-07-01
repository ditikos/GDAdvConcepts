extends Area2D

onready var TxtLabel = find_node("txtDescription", true, false)
onready var CommandText = get_tree().get_root().find_node("commandText", true, false)

var count = 0
var timer

func _ready():
	timer = Timer.new()
	add_child(timer)
	connect("input_event", self, "_on_ObjectTemplate_input_event")
	connect("mouse_entered", self, "_on_ObjectTemplate_mouse_entered")
	connect("mouse_exited", self, "_on_ObjectTemplate_mouse_exited")
	

func _on_ObjectTemplate_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				print("[WPH01] Left button was clicked at ", event.position)
				egoSay("This is Dinos, a famous explorer.")
			else:
				print("[WPH01] Left button was released")
		if event.button_index == BUTTON_WHEEL_DOWN:
			print("[WPH01] Wheel down")

func _on_ObjectTemplate_mouse_entered():
	CommandText.text = "LOOK AT PAINTING"
	
func _on_ObjectTemplate_mouse_exited():
	CommandText.text = ""


func egoSay(text):
	get_tree().call_group("ego","say",text,self)
	timer.set_wait_time(1.0)
	timer.connect("timeout", self, "_remove_text")
	timer.start()
	
func _remove_text():
	TxtLabel.hide()
	
