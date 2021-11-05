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

void main()
{
    float rad = 0.4 * vertex.y * sin(time); 
    vec3 V = mat3(vec3(cos(rad), 0, -sin(rad)), vec3(0, 1, 0), vec3(sin(rad), 0, cos(rad))) * vertex; 
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(V, 1.0);
}
