shader_type spatial;

uniform vec2 testdirection;
uniform float speeed;
uniform float steeepness : hint_range(0.0, 1.0, 0.05) = 1.0;
uniform float aamplitude = 1.0;
uniform float waavelength = 1.0;

// direction.y represents z axis (since it is 2D vec)
vec3 gerstner(vec3 vertex, vec2 direction, float time, float speed, float steepness, float amplitude, float wavelength){
	float displaced_x = vertex.x + (steepness/wavelength) * direction.x * cos(wavelength * dot(direction, vertex.xz) + speed * time);
	float displaced_z = vertex.z + (steepness/wavelength) * direction.y * cos(wavelength * dot(direction, vertex.xz) + speed * time);
	float displaced_y = vertex.y + amplitude * sin(wavelength * dot(direction, vertex.xz) + speed * time);
	return vec3(displaced_x, displaced_y, displaced_z);
}

vec3 gerstner_normal(vec3 vertex, vec2 direction, float time, float speed, float steepness, float amplitude, float wavelength) {
    float cosfactor = cos(wavelength * dot(direction, vertex.xz + speed * time));
	float sinfactor = sin(wavelength * dot(direction, vertex.xz + speed * time));
	float x_normal = -direction.x * wavelength * amplitude * cosfactor;
	float z_normal = -direction.y * wavelength * amplitude * cosfactor;
	float y_normal = 1.0 - (steepness/wavelength) * wavelength * amplitude * sinfactor;
	return vec3(x_normal, y_normal, z_normal);
}

void vertex(){
	VERTEX = gerstner(VERTEX, normalize(testdirection), TIME, speeed, steeepness, aamplitude, waavelength);
	NORMAL = gerstner_normal(VERTEX, normalize(testdirection), TIME, speeed, steeepness, aamplitude, waavelength);
}