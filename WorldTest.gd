extends Node2D

var ObjectTemplate = preload("res://ObjectTemplate.tscn")
var dict = {}

func _ready() -> void:
	var file = "res://assets/script.json"
	var json = load_file(file);
	parse_JSON(json)
	var my_group_members = get_tree().get_nodes_in_group("LobbyObjects")
	for area in my_group_members:
		print(area.name)
#		area.connect("input_event", self, "_on_area_clicked", [area])

func load_file(path):
	var file = File.new()
	file.open(path, File.READ)
	var content = file.get_as_text()
	file.close()
	return content

func parse_JSON(content):
	var dict = JSON.parse(content)
	print(content)
	if dict.error == OK:
		var data = dict.result
#		print(typeof(data))
#		print(data)
#		print(data.room.body.objects)"
		$Background.texture = load("res://assets/"+data.room.image)
		var objects = data.room.body.objects
		var count = 0
		for object in objects:
			var objGroup = data.room.group + "Objects"
			var objScript = data.room.group + "Script.gd"
			# check if script exists
			var resScript = null
			var scriptPath = "res://assets/GameScripts/"+object.name+"_script.gd"
			if fileCheck(scriptPath):
				resScript = load(scriptPath)
			# end check
			var tmp = ObjectTemplate.instance()
			tmp.name = object.name
			tmp.position = Vector2(object.x, object.y)
			var shape = RectangleShape2D.new()
			tmp.get_node("CollisionShape2D").shape = shape
			
			# currently only 1 state supported (state0)
			for state in object.states:
				print(state.image)
				shape.extents = Vector2(state.hs_x / 2, state.hs_y / 2)
				tmp.get_node("Sprite").texture = load("res://assets/"+state.image)
			tmp.add_to_group(objGroup)
			
			# then add the script
			if resScript != null:
				tmp.script = resScript
			# end add script
			add_child(tmp)
	else:
		print("Error: ", dict.error)
		print("Error Line: ", dict.error_line)
		print("Error String:", dict.error_string)

func fileCheck(resource_path):
	var check = false
	var filePath = File.new()
	check = filePath.file_exists(resource_path)
	filePath.close()
	return check
