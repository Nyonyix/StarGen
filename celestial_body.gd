class_name CelestialBody extends Node2D

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

var colour: Color:
	get:
		return colour
	set(value):
		colour = value

var temperature: float:
	get:
		return temperature
	set(value):
		temperature = value

var luminosity: float:
	get:
		return luminosity
	set(value):
		luminosity = value

func _init() -> void:

	pass