#version 330 core

uniform sampler2D colorMap; 

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord; 
in vec3 normal_eye; 
in vec3 vertex_eye; 

uniform float time; 

uniform vec4 matSpecular;
uniform vec4 lightSpecular; 
uniform float matShininess; 
uniform vec4 lightPosition; 

void main()
{

    vec3 N = normalize(normal_eye); 
    vec3 L = normalize(lightPosition.xyz - vertex_eye); 
    vec3 V = normalize(-vertex_eye); 
    vec3 R = normalize(2.0*dot(N, L)*N-L); 
    float NdotL = max(0.0, dot(N, L)); 
    float RdotV; 
    if (NdotL <= 0) {
        RdotV = 0; 
    }
    else {
        RdotV = max(0.0, dot(R, V));    
    }

    vec4 light_difosa; 

    if (int(time) % 2 == 0) {
        light_difosa = mix(vec4(0), vec4(0.8), fract(time)); 
    }
    else {
        light_difosa = mix(vec4(0.8), vec4(0), fract(time));  
    }

    vec4 mat_difosa; 


    mat_difosa = texture(colorMap, vtexCoord); 

    vec4 terme_difosa = (vec4(light_difosa) * (mat_difosa)) * NdotL; 

    vec4 terme_specular = lightSpecular * matSpecular * (pow(RdotV, matShininess)); 

    fragColor = terme_difosa + terme_specular; 



}
