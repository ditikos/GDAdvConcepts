extends Node

onready var MessageLabel = get_tree().get_root().find_node("MessageLabel", true, false)

func _ready():
	connect("mouse_entered", self, "_on_TemplateObject_mouse_entered")
	connect("mouse_exited", self, "_on_TemplateObject_mouse_exited")

func _on_TemplateObject_mouse_entered():
	MessageLabel.text = "Script 02 Mouse Entered"

func _on_TemplateObject_mouse_exited():
	MessageLabel.text = "Script 02 Mouse Exited"
