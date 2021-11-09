#version 330 core
uniform sampler2D sampler; 
in vec2 vtexCoord; 
uniform float time; 
out vec4 fragColor;



void main()
{
    if (fract(time) <= 0.5) {
        fragColor = texture(sampler, vtexCoord); 
    }
    else {
        if (length(vec2(0.393, 0.652) - vtexCoord) <= 0.025) {
            vec2 texCoord;
            texCoord.x = vtexCoord.x + 0.057; 
            texCoord.y = vtexCoord.y + (-0.172); 
            fragColor = texture(sampler, texCoord); 
        }
        else {
            fragColor = texture(sampler, vtexCoord); 
        }
    }
}
