#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec4 lightAmbient; 
uniform vec4 lightDiffuse; 
uniform vec4 lightSpecular; 

uniform vec4 matAmbient; 
uniform vec4 matDiffuse; 
uniform vec4 matSpecular; 

uniform vec4 lightPosition; 
uniform float matShininess; 

uniform mat4 modelViewMatrix; 


vec4 Phong (vec3 N, vec3 L, vec3 V) {
    N = normalize(N);
    V = normalize(V); 
    L = normalize(L); 

    vec3 R = normalize(2.0*(dot(N, L))*N-L);  

    float NdotL = max(0.0, dot(N, L)); 
    float RdotV; 
    if (NdotL > 0.0) {
        RdotV = max(0.0, dot(R, V)); 
    }
    else {
        RdotV = 0.0; 
    }

    return ((matAmbient*lightAmbient)+(matDiffuse*lightDiffuse*NdotL)+(matSpecular*lightSpecular*(pow(RdotV, matShininess))));

}





void main()
{
    vec3 N = normalize(normalMatrix * normal);
    vec3 P = (modelViewMatrix * vec4(vertex, 1.0)).xyz; 
    vec3 L = lightPosition.xyz - P; 
    vec3 V = -P; 


    frontColor = Phong(N, L, V);
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
