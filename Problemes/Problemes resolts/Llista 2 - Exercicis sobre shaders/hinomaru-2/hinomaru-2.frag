#version 330 core



out vec4 fragColor;

in vec2 vtexCoord; 

uniform bool classic = false; 

void main()
{

    if (classic == true) {
        if (length(vec2(0.5, 0.5) - vtexCoord) <= 0.2) {
            fragColor = vec4(1, 0, 0, 1); 
        }
        else {
            fragColor = vec4(1, 1, 1, 1); 
        }
    }


    else {
        vec2 u = vtexCoord - vec2(0.5, 0.5); 
        float angle = atan(u.t, u.s); 
        if ((length(vec2(0.5, 0.5) - vtexCoord) <= 0.2) || (mod((angle/(acos(-1)/16.)) + 0.5, 2) < 1)) {
            fragColor = vec4(1, 0, 0, 1);
        }
        else {
            fragColor = vec4(1, 1, 1, 1); 
        }
    }
}
