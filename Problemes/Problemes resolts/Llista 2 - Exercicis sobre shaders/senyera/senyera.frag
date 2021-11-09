#version 330 core

in vec2 vtexCoord; 
out vec4 fragColor;

uniform vec4 Y = vec4(1,1,0,1); 
uniform vec4 R = vec4(1,0,0,1); 

void main()
{
    if (int(vtexCoord.s * 9.0) % 2 == 0) {
        fragColor = Y; 
    }
    else fragColor = R; 
}
