class_name Star extends Node2D

var spectral_class: String:
    get:
        return spectral_class
    set(value):
        spectral_class = value

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


func _init() -> void:

        pass