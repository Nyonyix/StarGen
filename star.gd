class_name Star extends Node2D

var def_data: Dictionary
var rng: RandomNumberGenerator

var scaler: float:
	get:
		return scaler
	set(value):
		scaler = value

var spectral_letter: String:
	get:
		return spectral_letter
	set(value):
		spectral_letter = value

var spectral_descriptor: String:
	get:
		return spectral_descriptor
	set(value):
		spectral_descriptor = value

var luminosity_descriptor: String:
	get:
		return luminosity_descriptor
	set(value):
		luminosity_descriptor = value

var stellar_class_string: String:
	get:
		return stellar_class_string
	set(value):
		stellar_class_string = value

var temperature: int:
	get:
		return temperature
	set(value):
		temperature = value

var mass: float:
	get:
		return mass
	set(value):
		mass = value

var radius: float:
	get:
		return radius
	set(value):
		radius = value

var luminosity: float:
	get:
		return luminosity
	set(value):
		luminosity = value

func _init(def_input: Dictionary, star_seed: int = 1) -> void:

	def_data = def_input
	rng = RandomNumberGenerator.new()
	rng.seed = star_seed

	scaler = 10 - rng.randf_range(0, 10)
	_generate_spectral_class()
	stellar_class_string = "%s V%d %s Main Sequence" % [spectral_letter, scaler, spectral_descriptor]

func _generate_spectral_class():

	var spectral_classes_data = def_data["spectral_classes"]
	var spectral_classes: Dictionary
	var weight_check = 0
	var current_weight = 0
	var random_weight = rng.randf_range(0, 100)

	for k in spectral_classes_data.keys():

		var weight = spectral_classes_data[k]["weight"]
		spectral_classes[k] = weight

		weight_check += weight
		if weight_check > 100:
			print("Spectral Class Weight > 100")
	if weight_check < 100:
		print("Spectral Class Weight < 100")

	for k in spectral_classes.keys():

		breakpoint

		var weight = spectral_classes[k]
		current_weight += weight

		if random_weight <= current_weight:
			spectral_letter = k
			spectral_descriptor = spectral_classes_data[k]["spectral_class_descriptor"]
