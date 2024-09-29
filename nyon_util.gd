class_name NyonUtil

const GRAVITATIONAL_CONSTANT = 6.67430e-11 # N⋅m^2⋅kg^(−2)
const GRAVITY_G = 9.80665 # m/s^2

static func calculate_volume(radius: float) -> float:

    return (4.0/3.0) * PI * radius ** 3

static func calculate_density(mass: float, volume: float) -> float:

    return mass / volume

static func calculate_surface_gravity(density: float, radius: float) -> float:

    return ((4 * PI) / 3) * GRAVITATIONAL_CONSTANT * density * radius