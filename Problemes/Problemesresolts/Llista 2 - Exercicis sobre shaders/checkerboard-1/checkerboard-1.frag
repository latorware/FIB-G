#version 330 core


in vec2 vtexCoord; 
out vec4 fragColor;

uniform vec4 gris = vec4(vec3(0.8), 1); 
uniform vec4 black = vec4(vec3(0.0), 1); 

void main()
{
    int x_mod = int(mod(vtexCoord.s * 8.0, 2)); 
    int y_mod = int(mod(vtexCoord.t * 8.0, 2)); 


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