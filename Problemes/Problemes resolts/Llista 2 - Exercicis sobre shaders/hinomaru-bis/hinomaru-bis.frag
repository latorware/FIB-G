#version 330 core

in vec2 vtexCoord; 
out vec4 fragColor;




void main()
{
    float d = length(vec2(0.5, 0.5) - vtexCoord); 
    float width = 0.7* length(vec2(dFdx(d), dFdy(d))); 
    fragColor = (vec4(1, smoothstep(0.2 - width, 0.2 + width, d), smoothstep(0.2 - width, 0.2 + width, d), 1)); 


    /*
    if (length(vec2(0.5, 0.5) - vtexCoord) <= 0.2) {
        fragColor = vec4(1, 0, 0, 1); 
    }

    else {
        fragColor = vec4(1, 1, 1, 1); 
    }
   */ 
    
}
