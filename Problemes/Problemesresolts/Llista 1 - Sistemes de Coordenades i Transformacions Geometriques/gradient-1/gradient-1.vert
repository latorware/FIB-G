#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMax; 
uniform vec3 boundingBoxMin; 

uniform vec3 RED=vec3(1,0,0);
uniform vec3 YELLOW=vec3(1,1,0);
uniform vec3 GREEN=vec3(0,1,0);
uniform vec3 CYAN=vec3(0,1,1);
uniform vec3 BLUE=vec3(0,0,1); 

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    float t = 4*(vertex.y - boundingBoxMin.y) / (boundingBoxMax.y - boundingBoxMin.y); 
    if (t == 0) {
        frontColor = vec4(RED, 1); 
    }
    else if (t < 1) {
        frontColor = vec4(mix(RED, YELLOW, t), 1); 
    }
    else if (t < 2) {
        frontColor = vec4(mix(YELLOW, GREEN, fract(t)), 1);
    }
    else if (t < 3) {
        frontColor = vec4(mix(GREEN, CYAN, fract(t)), 1); 
    }
    else if (t < 4) {   
        frontColor = vec4(mix(CYAN, BLUE, fract(t)), 1); 
    }
    else {
        frontColor = vec4(BLUE, 1); 
    }
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
