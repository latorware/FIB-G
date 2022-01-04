#version 330 core

uniform sampler2D colorMap0;
uniform sampler2D colorMap1; 
uniform sampler2D colorMap2; 
uniform sampler2D colorMap3;


out vec4 fragColor;
in vec2 vtexCoord; 


uniform float time; 

uniform float slice = 0.1; 

void main()
{
    float total = slice * 4.0; 

    float iteration = mod(time, total); 

    if (iteration >= 0 && iteration < slice) { 
        fragColor = texture(colorMap0, vtexCoord); 
    }
    else if ((iteration >= slice) && (iteration < 2.0 * slice)) {
        fragColor = texture(colorMap1, vtexCoord); 
    }
    else if ((iteration >= 2.0 * slice) && (iteration < 3.0 * slice)) {
        fragColor = texture(colorMap2, vtexCoord); 
    }
    else if ((iteration >= 3.0 * slice) && (iteration < 4.0 * slice)) {
        fragColor = texture(colorMap3, vtexCoord); 
    }
}
