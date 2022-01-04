#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;
out vec3 normal_eye;
out vec3 vertex_eye;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;

uniform float time; 

void main()
{
    
    normal_eye = normalize(normalMatrix * normal); 
    vertex_eye = (modelViewMatrix * vec4(vertex, 1.0)).xyz;

    vtexCoord = vec2(texCoord.s / 4.0, texCoord.t / 3.0); 
    int n_imatge = (int(time) % 24) / 2; 
    int x = n_imatge / 3; 
    int y = n_imatge % 3; 
    vtexCoord.x = vtexCoord.x + (x / 4.0); 
    vtexCoord.y = vtexCoord.y + ((2.0/3.0) - (y / 3.0));  

    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
