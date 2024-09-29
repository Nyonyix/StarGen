extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	var def_file = FileAccess.open("res://definitions.json", FileAccess.READ).get_as_text()
	var def_data = JSON.parse_string(def_file)
	var star_seed = 452389375

	for i in range(100):

		var star = Star.new(def_data["star"], star_seed)

		print(star.get("stellar_class_string"))
		print("\tTemperature: %s" % star.get("temperature"))
		print("\tLuminosity: %f" % star.get("luminosity"))
		print("\tMass: %.2f" % star.get("mass"))
		print("\tRadius: %.2f" % star.get("radius"))
		print("\tDensity: %.2f" % star.get("density"))
		print("\tSurface Gravity: %.2f" % star.get("surface_gravity"))

		star_seed += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
