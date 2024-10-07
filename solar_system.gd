class_name SolarSystem extends CelestialBody

var star_system_types: Dictionary
var star_data: Dictionary
var rng = RandomNumberGenerator

var star_count: int:
	get:
		return star_count
	set(value):
		star_count = value

var system_type_string: String:
	get:
		return system_type_string
	set(value):
		system_type_string = value

var system_type_descriptor: String:
	get:
		return system_type_descriptor
	set(value):
		system_type_descriptor = value

var system_map: Dictionary:
	get:
		return system_map
	set(value):
		system_map = value

var system_stars: Array[Star]:
	get:
		return system_stars
	set(value):
		system_stars = value

func get_heaviest_star() -> Star:

	var val = system_stars.front()
	system_stars.pop_front()
	return val

func _init(star_def_data: Dictionary, seed_in: int) -> void:

	super()

	rng = RandomNumberGenerator.new()
	rng.seed = seed_in
	
	star_data = star_def_data["spectral_classes"]
	star_system_types = star_def_data["star_system_types"]

	_generate_solar_system_type()
	_generate_stars()

func _generate_solar_system_type() -> void:

	var solar_system_type_dict: Dictionary
	var weight_check = 0
	var current_weight = 0
	var random_weight = rng.randf_range(0, 100)

	for k in star_system_types.keys():

		var weight = star_system_types[k]["weight"]
		solar_system_type_dict[k] = weight

		weight_check += weight
		if weight_check > 100:
			print("Solar System Type Weight > 100: %.1f" % [weight_check])
	if weight_check < 100:
		print("Solar System Type Weight < 100: %.1f" % [weight_check])

	for k in solar_system_type_dict.keys():

		current_weight += solar_system_type_dict[k]

		if random_weight <= current_weight:

			system_type_string = k
			system_map = star_system_types[k]["star_map"]
			star_count = star_system_types[k]["star_count"]
			system_type_descriptor = star_system_types[k]["star_system_type_descriptor"]
			break

func _generate_stars() -> void:

	for s in star_count:

		system_stars.append(Star.new(star_data, rng.seed))
		rng.seed += 1

	system_stars.sort_custom(func(a, b): return a.get("mass") > b.get("mass"))

