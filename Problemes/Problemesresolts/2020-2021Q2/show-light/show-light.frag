#version 330 core

in vec4 gfrontColor;


in vec2 gtexCoord; 

uniform sampler2D colorMap; 


out vec4 fragColor;

void main()
{

    if (gtexCoord.x < -0.0) {
        fragColor = gfrontColor;
    }
    else {
        vec4 c = texture(colorMap, gtexCoord); 
        if (c.w >= 0.1) {
            fragColor = c * c.w; 
        }
        else {
            discard; 
        }

    }
    
}
