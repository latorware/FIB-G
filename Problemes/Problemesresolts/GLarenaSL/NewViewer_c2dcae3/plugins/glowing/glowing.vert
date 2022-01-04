#version 330 core
uniform mat4 modelViewProjectionMatrix;

uniform vec3 boundingBoxMin;

uniform vec3 boundingBoxMax;

layout (location = 0) in vec3 vertex;

void main()
{
	float percentatgex = (vertex.x + 1.0) / (2.0); 
	float percentatgez = (vertex.z + 1.0) / (2.0); 
	vec3 vertexx; 
	vertexx.x = mix(boundingBoxMin.x, boundingBoxMax.x, percentatgex); 
	vertexx.y = boundingBoxMin.y; 
	vertexx.z = mix(boundingBoxMin.z, boundingBoxMax.z, percentatgez); 
	gl_Position    = modelViewProjectionMatrix * vec4(vertexx,1.0);
}

