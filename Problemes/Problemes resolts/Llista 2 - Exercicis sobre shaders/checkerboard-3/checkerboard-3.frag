#version 330 core

in vec2 vtexCoord; 
out vec4 fragColor;

uniform float n = 8; 



uniform vec4 gris = vec4(vec3(0.8), 1.); 
uniform vec4 black = vec4(vec3(0.0), 1.); 

void main()
{
    float x = vtexCoord.s * n;
    float y = vtexCoord.t * n;

    if (fract(x) <= 0.1 || fract(y) <= 0.1) { 
        fragColor = black; 
    }

    else fragColor = gris; 
}
