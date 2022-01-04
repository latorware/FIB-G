#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix; 
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMax; 
uniform vec3 boundingBoxMin; 
uniform bool eyespace = true; 
uniform float time; 


void main()
{

    float diagonal = length(boundingBoxMax-boundingBoxMin); 
    float amplitude; 
    if (eyespace) {
        amplitude = (diagonal/(10*2))*((modelViewMatrix*vec4(vertex, 1.0)).y); 
    }
    else {
        amplitude = (diagonal/(10*2))*(vertex.y); 
    }
    float factor = amplitude * sin(time); 
    vec3 V = vertex + normal*factor; 
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(V, 1.0);
}
