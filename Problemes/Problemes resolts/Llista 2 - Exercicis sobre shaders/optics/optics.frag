#version 330 core

uniform sampler2D tex; 


in vec2 vtexCoord; 
in vec4 frontColor;
out vec4 fragColor;
in vec3 P_model; 

const float eta = 1.7; 

uniform float time; 

void main()
{


    if (P_model.z <= 1.5) { 
        fragColor = texture(tex, vtexCoord); 
    }

    else {
        vec3 P; 
        vec3 dir; 
        trace(P_model, P, dir); 

        float z_current = -1.5 - pow(sin(time), 2); 

        float lampda = (z_current - P.z)/dir.z; 

        x_current = P.x + lampda*dir; 
        y_current = P.y + lampda*dir; 

        if ((x_current < 2 || x_current > 2) || (y_current < 2 || y_current > 2)) {
            fragColor = vec4(0.97); 
        }
        else {


            vec2 vtex; 
            vtex.x = (x_current + 2.0)/(4.0); 
            vtex.y = (y_current + 2.0)/(4.0);

            texture(tex, vtex); 
        }
    }
}
