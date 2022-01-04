#version 330 core

in vec3 NDC; 
out vec4 fragColor;
uniform float time; 

void main()
{
    float screen_percentage = (time - 0.0)/(2.0); 
    float point_position = (NDC.x + 1.0)/(2.0); 

    if (point_position <= screen_percentage) {
        fragColor = vec4(0,0,1,1); 
    }
    else {
        discard; 
    }
}
 