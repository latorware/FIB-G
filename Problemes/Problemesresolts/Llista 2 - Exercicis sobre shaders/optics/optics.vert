#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float time; 



out vec3 P_model; 

void main()
{

    vec3 V = vertex; 
    P_model = V; 

    if (V.z == -1.5) {
        V.z = -1.5 - pow(sin(time),2); 
    }
    else {
    }


    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(V, 1.0);
}
