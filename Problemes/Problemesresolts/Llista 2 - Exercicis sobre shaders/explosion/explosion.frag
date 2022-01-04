#version 330 core

uniform sampler2D colorMap; 

out vec4 fragColor;

in vec2 vtexCoord; 

uniform float time; 

void main()
{
    int frame = int(30 * time) % 48; 
    float s = (frame % 8) / 8.0; 
    float t = (5 - frame / 8) / 6.0; 

    vec2 texCoord = vtexCoord * vec2(1.0/8.0, 1.0/6); 
    texCoord.s += s; 
    texCoord.t += t; 
    fragColor = texture(colorMap, texCoord); 
    fragColor *= fragColor.w;  
}