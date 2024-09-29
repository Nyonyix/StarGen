class_name Star extends Node2D

const STEFFAN_BOLTZMANN = 5.670374419e-8
const SOLAR_MASS = 1.9885e30 # Kg
const SOLAR_RADIUS = 6.957e8 # m
const SOLAR_LUMINOSITY = 3.828e26 # W
const SOLAR_VOLUME = 1.412e27 # m^3
const GRAVITY_SUN = NyonUtil.GRAVITY_G * 28.02

var def_data: Dictionary
var rng: RandomNumberGenerator

var colour: Color:
	get:
		return colour
	set(value):
		colour = value

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

var luminosity_letter: String:
	get:
		return luminosity_letter
	set(value):
		luminosity_letter = value

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

var temperature: float:
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

var volume: float:
	get:
		return volume
	set(value):
		volume = value

var density: float:
	get:
		return density
	set(value):
		density = value

var surface_gravity: float:
	get:
		return surface_gravity
	set(value):
		surface_gravity = value

func _init(def_input: Dictionary, star_seed: int = 1) -> void:

	def_data = def_input
	rng = RandomNumberGenerator.new()
	rng.seed = star_seed

	scaler = 10 - rng.randf_range(0.1, 10)
	_generate_spectral_class()
	_generate_luminosity_class()
	stellar_class_string = "%s%.1f %s %s %s" % [spectral_letter, scaler, luminosity_letter, spectral_descriptor, luminosity_descriptor]
	
	temperature = floori(_generate_range("temp"))
	mass = _generate_range("mass")
	radius = _generate_range("radius")

	_calculate_luminosity()

	volume = NyonUtil.calculate_volume(radius * SOLAR_RADIUS) / SOLAR_VOLUME
	density = NyonUtil.calculate_density(mass * SOLAR_MASS, volume * SOLAR_VOLUME)
	surface_gravity = NyonUtil.calculate_surface_gravity(density, radius * SOLAR_RADIUS) / NyonUtil.GRAVITY_G
	
	colour = NyonUtil.convert_kelvin_to_rgb(int(temperature))

func _generate_spectral_class() -> void:

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
			print("Spectral Class Weight > 100: %.1f" % [weight_check])
	if weight_check < 100:
		print("Spectral Class Weight < 100: %.1f" % [weight_check])

	for k in spectral_classes.keys():

		var weight = spectral_classes[k]
		current_weight += weight

		if random_weight <= current_weight:
			spectral_letter = k
			spectral_descriptor = spectral_classes_data[k]["spectral_class_descriptor"]
			break

func _generate_luminosity_class() -> void:

	var luminosity_classes_data = def_data["spectral_classes"][spectral_letter]["luminosity_classes"]
	var luminosity_classes: Dictionary
	var weight_check = 0
	var current_weight = 0
	var random_weight = rng.randf_range(0, 100)

	for k in luminosity_classes_data.keys():

		var weight = luminosity_classes_data[k]["weight"]
		luminosity_classes[k] = weight

		weight_check += weight
		if weight_check > 100:
			print("Luminosity Weights > 100: %s: %.1f" % [spectral_letter, weight_check])
	if weight_check < 100:
		print("Luminosity Weight < 100: %s: %.1f" % [spectral_letter, weight_check])

	for k in luminosity_classes.keys():

		var weight = luminosity_classes[k]
		current_weight += weight

		if random_weight <= current_weight:
			luminosity_letter = k
			luminosity_descriptor = luminosity_classes_data[k]["luminosity_class_descriptor"]
			break

func _generate_range(range_key: String) -> float:

	var range_data
	if range_key == "temp":
		range_data = def_data["spectral_classes"][spectral_letter]["temp"]
	else:
		range_data = def_data["spectral_classes"][spectral_letter]["luminosity_classes"][luminosity_letter][range_key]
	
	var range_min = range_data[0]
	var range_max = range_data[1]
	var range_gap = range_max - range_min
	var offset = rng.randf_range(0.925, 1.075)
	var corrected_scaler = 10 - scaler

	return ((range_gap * (corrected_scaler / 10)) * offset) + range_min

func _calculate_luminosity() -> void:

	var surface_area = 4 * PI * ((radius * SOLAR_RADIUS) ** 2)
	luminosity = (STEFFAN_BOLTZMANN * surface_area * (temperature ** 4)) / SOLAR_LUMINOSITY
