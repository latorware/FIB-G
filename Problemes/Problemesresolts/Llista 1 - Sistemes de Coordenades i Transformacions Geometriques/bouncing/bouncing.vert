#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float scale = 8.0;  
uniform float time; 
uniform vec3 T0 = vec3(-1,-1,0);  


float triangleWave(float x) {
    return abs(mod(x, 2) - 1.0);  
}

void main()
{
    vec3 translation = scale * (T0 + vec3(2 * triangleWave(time/1.618), 2 *triangleWave(time), 0)); 
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(0.3, 0.3, 0.9, 1.0) * N.z; 
    gl_Position = modelViewProjectionMatrix * vec4((vertex + translation)/scale, 1.0);
}
 