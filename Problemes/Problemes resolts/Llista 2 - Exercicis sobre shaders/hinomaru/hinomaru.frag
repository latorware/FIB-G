#version 330 core

in vec2 vtexCoord; 
out vec4 fragColor;




void main()
{

    if (length(vec2(0.5, 0.5) - vtexCoord) <= 0.2) {
        fragColor = vec4(1, 0, 0, 1); 
    }

    else {
        fragColor = vec4(1, 1, 1, 1); 
    }

    
}
