#version 330 core


out vec4 fragColor;

in vec2 vtexCoord; 

uniform vec4 gris = vec4(vec3(0.8), 1); 
uniform vec4 black = vec4(vec3(0.0), 1); 



uniform float n = 8; 

void main()
{
    int x_mod = int(mod(vtexCoord.s * n, 2)); 
    int y_mod = int(mod(vtexCoord.t * n, 2)); 

    if (y_mod == 0) {
        if (x_mod == 0) {
            fragColor = gris; 
        }
        else {
            fragColor = black;
        }
    }
    else {
        if (x_mod == 0) {
            fragColor = black;
        }
        else {
            fragColor = gris; 
        }
    }
}
