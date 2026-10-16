"""Geographic distance utilities for CRITICAL."""

import from math {sin, cos, sqrt, atan2}

def:pub distance_km(
    lat1: float,
    lon1: float,
    lat2: float,
    lon2: float
) -> float {
    pi: float = 3.141592653589793;
    earth_radius_km: float = 6371.0;

    dlat: float = (lat2 - lat1) * pi / 180.0;
    dlon: float = (lon2 - lon1) * pi / 180.0;

    sin_lat: float = sin(dlat / 2.0);
    sin_lon: float = sin(dlon / 2.0);
    cos_lat1: float = cos(lat1 * pi / 180.0);
    cos_lat2: float = cos(lat2 * pi / 180.0);

    a: float = (
        sin_lat * sin_lat
        + cos_lat1 * cos_lat2 * sin_lon * sin_lon
    );

    if a < 0.0 {
        a = 0.0;
    }
    if a > 1.0 {
        a = 1.0;
    }

    c: float = 2.0 * atan2(sqrt(a), sqrt(1.0 - a));
    return earth_radius_km * c;
}
