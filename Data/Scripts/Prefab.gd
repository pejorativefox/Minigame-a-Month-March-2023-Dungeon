
class_name Prefab

var width: int
var height: int
var data: Array

func load(filename: String) -> void:
	print_debug("Loading: ", filename)
	var jsonBuffer = FileAccess.open(filename, FileAccess.READ).get_as_text()
	var jsonData = JSON.parse_string(jsonBuffer)
	width = int(jsonData["stride"])
	for line in jsonData["layout"]:
		for c in line:
			data.append(c)
	height = data.size() / width
	
	print_debug(width)
	print_debug(height)
	print_debug(data)
