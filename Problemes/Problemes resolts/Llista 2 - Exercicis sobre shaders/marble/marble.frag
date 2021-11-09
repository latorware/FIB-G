#version 330 core

uniform sampler2D colorMap; 

in vec4 frontColor;
out vec4 fragColor;

in vec3 normal_object; 
in vec3 vertex_object; 

uniform vec4 white = vec4(1,1,1,1); 
uniform vec4 redish = vec4(0.5, 0.2, 0.2, 1.0); 

uniform mat4 modelViewMatrix; 
uniform mat3 normalMatrix; 



vec4 shading(vec3 N, vec3 Pos, vec4 diffuse) {    
    vec3 lightPos = vec3(0.0,0.0,2.0);    
    vec3 L = normalize( lightPos - Pos );    
    vec3 V = normalize( -Pos);    
    vec3 R = reflect(-L,N);    
    float NdotL = max( 0.0, dot( N,L ) );    
    float RdotV = max( 0.0, dot( R,V ) );    
    float Ispec = pow( RdotV, 20.0 );    
    return diffuse * NdotL + Ispec;
    }








void main()
{
    vec2 texCoord = vec2(  (dot((0.3*vec3(0,1,-1)),vertex_object))  ,   (dot((0.3*vec3(-2, -1, 1)), vertex_object))     );
    float valor = texture(colorMap, texCoord).r; 
    vec4 diffuse_color; 
    float interp;
    if (valor < 0.5) {
        interp = valor * 2.0 ; 
        diffuse_color = mix(white, redish, interp); 
    }
    else if (valor >= 0.5) {
        interp = (valor - 0.5)/0.5; 
        diffuse_color = mix(redish, white, interp); 
    }
    vec3 vertex_en_eye= (modelViewMatrix*vec4(vertex_object, 1)).xyz;  

    vec3 normal_en_ull = normalize(normalMatrix * normal_object);  


    
    fragColor = shading(normal_en_ull, vertex_en_eye, diffuse_color); 
}
