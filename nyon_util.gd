class_name NyonUtil

const GRAVITATIONAL_CONSTANT = 6.67430e-11 # N⋅m^2⋅kg^(−2)
const GRAVITY_G = 9.80665 # m/s^2

static func calculate_volume(radius: float) -> float:

    return (4.0/3.0) * PI * radius ** 3

static func calculate_density(mass: float, volume: float) -> float:

    return mass / volume

static func calculate_surface_gravity(density: float, radius: float) -> float:

    return ((4 * PI) / 3) * GRAVITATIONAL_CONSTANT * density * radius

static func _convert_red(kelvin: int) -> int:

    if kelvin <= 66:

        return 255
    
    else:

        var red: int = round(329.698727446 * (kelvin - 60) ** -0.1332047592)
        red = 0 if red < 0 else red
        red = 255 if red > 255 else red
        return red

static func _convert_green(kelvin: int) -> int:

    if kelvin <= 66:

        var green:int = round(99.4708025861 * log(kelvin) - 161.11955681661)
        green = 0 if green < 0 else green
        green = 255 if green > 255 else green
        return green

    else:

        var green: int = round(288.1221695283 * (kelvin - 60) ** -0.0755148492)
        green = 0 if green < 0 else green
        green = 255 if green > 255 else green
        return green 

static func _convert_blue(kelvin: int) -> int:

    if kelvin >= 66:

        return 255

    else:

        if kelvin <= 19:

            return 0
        
        else:

            var blue: int = round(138.5177312231 * log(kelvin - 10) - 305.0447927307)
            blue = 0 if blue < 0 else blue
            blue = 255 if blue > 255 else blue
            return blue  

static func convert_kelvin_to_rgb(kelvin: int) -> Color:

    kelvin = kelvin / 100

    return Color8(_convert_red(kelvin), _convert_green(kelvin), _convert_blue(kelvin))