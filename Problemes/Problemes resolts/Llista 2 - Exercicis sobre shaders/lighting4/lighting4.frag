#version 330 core

in vec3 N; 
in vec3 P; 
out vec4 fragColor; 

uniform vec4 matAmbient; 
uniform vec4 matDiffuse; 
uniform vec4 matSpecular; 

uniform vec4 lightAmbient; 
uniform vec4 lightDiffuse; 
uniform vec4 lightSpecular; 

uniform float matShininess; 
uniform vec4 lightPosition; 



vec4 Phong (vec3 L, vec3 V, vec3 N) {
    N = normalize(N); 
    V = normalize(V); 
    L = normalize(L); 

    vec3 R = 2.0*(dot(N, L))*N - L; 

    float NdotL = max(0.0, dot(N, L)); 
    float RdotVpowS; 

    if (NdotL <= 0.0) {
        RdotVpowS = 0; 
    }
    else {
        RdotVpowS = pow(max(0.0, dot(R, V)), matShininess); 
    }

    return ((matAmbient*lightAmbient)+(matDiffuse*lightDiffuse*NdotL)+(matSpecular*lightSpecular*RdotVpowS)); 
}



void main()
{
    vec3 L = lightPosition.xyz - P; 
    vec3 V = -P; 
    fragColor = Phong(L, V, N);
}
