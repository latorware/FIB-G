#version 330 core


out vec4 fragColor;
in vec2 vtexCoord; 



void main()
{
    if (length(vec2(0.1, 0.1) - vtexCoord) < 0.05) {
        fragColor = vec4(0, 1, 0, 1); 
    }
    else if (length(vec2(0.1, 0.2) - vtexCoord) < 0.05) {
        fragColor = vec4(0, 1, 0, 1); 
    }
    else if (length(vec2(0.1, 0.3) - vtexCoord) < 0.05) {
        fragColor = vec4(0, 1, 0, 1); 
    }
    else if (length(vec2(0.1, 0.4) - vtexCoord) < 0.05) {
        fragColor = vec4(0, 1, 0, 1); 
    }
    else if (length(vec2(0.1, 0.5) - vtexCoord) < 0.05) {
        fragColor = vec4(0, 1, 0, 1); 
    }
    else if (length(vec2(0.1, 0.6) - vtexCoord) < 0.05) {
        fragColor = vec4(0, 1, 0, 1); 
    }
    else if (length(vec2(0.1, 0.7) - vtexCoord) < 0.05) {
        fragColor = vec4(0, 1, 0, 1); 
    }
    else if (length(vec2(0.2, 0.7) - vtexCoord) < 0.05) {
        fragColor = vec4(0, 1, 0, 1); 
    }
    else if (length(vec2(0.3, 0.7) - vtexCoord) < 0.05) {
        fragColor = vec4(0, 1, 0, 1); 
    }
    else if (length(vec2(0.4, 0.7) - vtexCoord) < 0.05) {
        fragColor = vec4(0, 1, 0, 1); 
    }
    else if (length(vec2(0.5, 0.6) - vtexCoord) < 0.05) {
        fragColor = vec4(0, 1, 0, 1); 
    }
    else if (length(vec2(0.5, 0.5) - vtexCoord) < 0.05) {
        fragColor = vec4(0, 1, 0, 1); 
    }
    else if (length(vec2(0.5, 0.4) - vtexCoord) < 0.05) {
        fragColor = vec4(0, 1, 0, 1); 
    }
    else if (length(vec2(0.5, 0.3) - vtexCoord) < 0.05) {
        fragColor = vec4(0, 1, 0, 1); 
    }
    else if (length(vec2(0.5, 0.2) - vtexCoord) < 0.05) {
        fragColor = vec4(0, 1, 0, 1); 
    }
    else if (length(vec2(0.4, 0.1) - vtexCoord) < 0.05) {
        fragColor = vec4(0, 1, 0, 1); 
    }
    else if (length(vec2(0.3, 0.1) - vtexCoord) < 0.05) {
        fragColor = vec4(0, 1, 0, 1); 
    }
    else if (length(vec2(0.2, 0.1) - vtexCoord) < 0.05) {
        fragColor = vec4(0, 1, 0, 1); 
    }
    else {
        discard; 
    }
}
 