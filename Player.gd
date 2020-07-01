extends Node


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("ego")


func say(text,objcaller):
	var txtDescription = objcaller.find_node("txtDescription",true,false)
	txtDescription.text = text
	txtDescription.show()
