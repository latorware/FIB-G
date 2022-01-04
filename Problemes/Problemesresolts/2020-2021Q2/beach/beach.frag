#version 330 core

uniform sampler2D window; 
uniform sampler2D palm1; 
uniform sampler2D background2; 

out vec4 fragColor;

in vec3 normaleye; 
in vec2 vtexCoord;
uniform float time; 

void main()
{

    vec4 c = texture(window, vtexCoord); 

    if (c.w == 1.0) {
        fragColor = c; 
    }
    else {
        vec4 d = texture(palm1, vtexCoord + 0.25*normaleye.xy + vec2(0.1*sin(2*time)*vtexCoord.t, 0)); 
        if (d.w >= 0.5) {
            fragColor = d;
        }
        else {
            fragColor = texture(background2,vtexCoord + 0.5*normaleye.xy ); 
        }
    }


}
 