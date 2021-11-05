#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;


uniform vec3 RED = vec3(1,0,0);
uniform vec3 YELLOW = vec3(1,1,0); 
uniform vec3 GREEN = vec3(0,1,0); 
uniform vec3 CYAN = vec3(0,1,1); 
uniform vec3 BLUE = vec3(0,0,1); 

uniform float min_y_normalized = -1; 
uniform float max_y_normalized = 1; 

void main()
{

    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
    float normalized_y = gl_Position.y / gl_Position.w; 
    float t = 4 * (normalized_y - min_y_normalized) / (max_y_normalized - min_y_normalized); 
    if (t == 0) {
        frontColor = vec4(RED, 1); 
    }
    else if (t < 1) {
        frontColor = vec4(mix(RED, YELLOW, fract(t)), 1); 
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
}

