#version 330 core


in vec2 vtexCoord; 
out vec4 fragColor;

uniform float n = 8; 

void main()
{
    if ((fract(vtexCoord.x*n)< 0.1) || (fract(vtexCoord.y*n) < 0.1)) {
        fragColor = vec4(0,0,0,1); 
    }
    else discard; 
}
