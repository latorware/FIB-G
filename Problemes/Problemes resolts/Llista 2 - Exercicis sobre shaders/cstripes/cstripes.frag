#version 330 core

in vec2 vtexCoord; 
out vec4 fragColor;

uniform vec2 origin = vec2(0,0); 

uniform int nstripes = 16; 

void main()
{
    float d = length(vtexCoord - origin);
    if (int(d*nstripes) % 2 != 0) {
        fragColor = vec4(1,1,0,1); 
    }
    else {
        fragColor = vec4(1,0,0,1); 
    }
}
