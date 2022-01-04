#version 330 core


out vec4 fragColor;
in vec2 vtexCoord; 

void main()
{
    if (vtexCoord.s < 0.4) {
        float tt = length(vec2(0.4, 0.5) - vtexCoord); 
        if (tt < 0.3) {
            float ts = length(vec2(0.5, 0.5) - vtexCoord); 
            if (ts > 0.3) {
                fragColor = vec4(1, 1, 1, 1); 
            }
            else {
                fragColor = vec4(0, 1, 0, 1);
            }
        }
        else {
            fragColor = vec4(0, 1, 0, 1); 
        }
    }

    else {
        
        if ((vtexCoord.s > 0.6) && (vtexCoord.s < 0.8) && (vtexCoord.t > 0.4) && (vtexCoord.t < 0.60000)) {
            fragColor = vec4(1, 1, 1, 1); 
        }
        else {
            fragColor = vec4(0, 1, 0, 1); 
        }
        
    }
}


// && (vtexCoord.t > 0.4) && (vtexCoord < 0.6)