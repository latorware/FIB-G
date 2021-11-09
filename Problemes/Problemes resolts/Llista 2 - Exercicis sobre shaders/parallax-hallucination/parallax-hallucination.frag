#version 330 core

uniform sampler2D map; 

in vec2 vtexCoord; 
out vec4 fragColor;

uniform float time; 
uniform float a = 0.5; 
uniform float PI = acos(-1); 



void main()
{

    vec4 color_inicial = texture(map, vtexCoord); 
    float m = max(color_inicial.x, max(color_inicial.y, color_inicial.z)); 
    vec2 u = vec2(m, m); 
    u = (mat2(vec2(cos(2.0 * PI * time), sin(2.0 * PI * time)), vec2(-sin(2.0 * PI * time), cos(2.0 * PI * time))) ) * u; 
    vec2 set = (a/100.0)*u; 
    fragColor = texture(map, vtexCoord + set); 
}
