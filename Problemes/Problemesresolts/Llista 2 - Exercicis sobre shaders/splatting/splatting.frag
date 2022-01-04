#version 330 core


uniform sampler2D noise0; 
uniform sampler2D rock1; 
uniform sampler2D grass2; 

out vec4 fragColor;

in vec2 vtexCoord;

void main()
{
    float noise = texture(noise0, vtexCoord).r;
    fragColor = mix(texture(rock1, vtexCoord), texture(grass2, vtexCoord), noise); 
}
