extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	var def_file = FileAccess.open("res://definitions.json", FileAccess.READ).get_as_text()
	if JSON.parse_string(def_file) == OK:
		var def_data = 


	var star = Star.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
