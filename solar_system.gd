class_name SolarSystem

var is_single_star: bool:
    get:
        return is_single_star
    set(value):
        is_single_star = value

var solar_system_map:Dictionary:
    get:
        return solar_system_map
    set(value):
        solar_system_map = value

func _init(star_map: Dictionary) -> void:

    pass