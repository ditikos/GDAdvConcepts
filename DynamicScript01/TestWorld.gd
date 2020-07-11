extends Node2D

const tmplObject = preload("res://TemplateObject.tscn")

var tmp = null
var shape = null

func _ready():
	print(0b111111111)
	connect_verbs()
	prototype_add_hotspots()
	
func connect_verbs():
	for child in $CanvasLayer/MarginContainer/VBoxContainer/VerbContainer.get_children():
		if child is Button:
			child.connect("pressed", self, "_on_button_pressed", [child])

func prototype_add_hotspots():
	tmp = tmplObject.instance()
	tmp.script = ResourceLoader.load("res://script1.gd")
	tmp.find_node("Sprite").texture = load("res://icon.png")
	tmp.position = Vector2(100,100)
	shape = RectangleShape2D.new()
	shape.extents = Vector2(32,32)
	tmp.find_node("CollisionShape2D").shape = shape
	add_child(tmp)
	
	tmp = tmplObject.instance()
	tmp.script = ResourceLoader.load("res://script2.gd")
	tmp.find_node("Sprite").texture = load("res://icon.png")
	tmp.position = Vector2(300,100)
	shape = RectangleShape2D.new()
	shape.extents = Vector2(20,20)
	tmp.find_node("CollisionShape2D").shape = shape
	add_child(tmp)

func _on_button_pressed(button):
	$CanvasLayer/MarginContainer/VBoxContainer/StatusText.text = button.text
	
