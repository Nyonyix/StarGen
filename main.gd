extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	var def_file = FileAccess.open("res://definitions.json", FileAccess.READ).get_as_text()
	var def_data = JSON.parse_string(def_file)
	var star_seed = 435489375
	var star_dict: Dictionary

	for i in range(100):

		# var star = Star.new(def_data["star"]["spectral_classes"], star_seed)

		# star_dict[i] = star

		# print(star.get("stellar_class_string"))
		# print("\tTemperature: %s" % star.get("temperature"))
		# print("\tLuminosity: %f" % star.get("luminosity"))
		# print("\tMass: %.2f" % star.get("mass"))
		# print("\tRadius: %.2f" % star.get("radius"))
		# print("\tDensity: %.2f" % star.get("density"))
		# print("\tSurface Gravity: %.2f" % star.get("surface_gravity"))

		var solar_system = SolarSystem.new(def_data["star"], star_seed)
		print(solar_system.get("system_type_descriptor"))

		for s in solar_system.get("system_stars"):

			print(s.get("stellar_class_string"))

		print("")
		star_seed += 1

	# for i in range(100):

	# 	var star = Star.new(def_data["star"], star_seed)

	# 	print(star.get("stellar_class_string"))
	# 	print("\tTemperature: %s" % star.get("temperature"))
	# 	print("\tLuminosity: %f" % star.get("luminosity"))
	# 	print("\tMass: %.2f" % star.get("mass"))
	# 	print("\tRadius: %.2f" % star.get("radius"))
	# 	print("\tDensity: %.2f" % star.get("density"))
	# 	print("\tSurface Gravity: %.2f" % star.get("surface_gravity"))

	# 	star_seed += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
