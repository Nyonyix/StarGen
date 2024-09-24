extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	var def_file = FileAccess.open("res://definitions.json", FileAccess.READ).get_as_text()
	var def_data = JSON.parse_string(def_file)
	var star_seed = 167333

	for i in range(10):

		var star = Star.new(def_data["star"], star_seed)
		print(star.get("stellar_class_string"))
		star_seed += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
