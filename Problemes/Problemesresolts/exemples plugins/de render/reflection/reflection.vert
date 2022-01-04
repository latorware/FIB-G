#version 330 core
layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;

uniform mat4 modelViewMatrix;
uniform mat4 modelViewProjectionMatrix;

uniform mat3 normalMatrix;

uniform vec4 lightPosition; // similar a gl_LightSource[0].position; en eye space

uniform vec3 boundingMin;
uniform vec3 boundingMax;
//uniform float radius;

//uniform float factor = 1.0;
//uniform bool texture;

uniform bool reflexiobaix; 
uniform bool reflexiox; 
uniform bool reflexioz; 
uniform bool real; 
uniform bool mirallbaix; 
uniform bool mirallx; 
uniform bool mirallz; 

out vec2 pos;
out vec3 N, V, L;

void main()
{
    vec4 paux = vec4(vertex,1.0);
    float PI = acos(-1); 

    if (reflexiobaix) {
        paux.y -= boundingMin.y;
        paux.y *= -1.0;
        paux.y += boundingMin.y;
        gl_Position = modelViewProjectionMatrix * paux;
        vec3 P = (modelViewMatrix*vec4(paux)).xyz;
        N = normalMatrix * normal;
        L = lightPosition.xyz - P; 
        V = -P;
    }

    else if (reflexiox) {
        paux.x -= boundingMin.x;
        paux.x *= -1.0;
        paux.x += boundingMin.x;
        vec3 P = (modelViewMatrix*vec4(paux)).xyz;
        N = normalMatrix * normal;
        L = lightPosition.xyz - P; 
        V = -P;

        gl_Position = modelViewProjectionMatrix * paux;
    }

    else if (reflexioz) {
        paux.z -= boundingMin.z;
        paux.z *= -1.0;
        paux.z += boundingMin.z;
        gl_Position = modelViewProjectionMatrix * paux;
        vec3 P = (modelViewMatrix*vec4(paux)).xyz;
        N = normalMatrix * normal;
        L = lightPosition.xyz - P; 
        V = -P;
    }

    else if (real) {
        gl_Position = modelViewProjectionMatrix * paux;
        vec3 P = (modelViewMatrix*vec4(vertex, 1.0)).xyz;
        N = normalMatrix * normal;
        L = lightPosition.xyz - P; 
        V = -P;
    }

    else if (mirallbaix) {
        paux.y = boundingMin.y;
        paux.x = mix(boundingMin.x, boundingMax.x, (vertex.x+1.0) / (2.0)); 
        paux.z = mix(boundingMin.z, boundingMax.z, (vertex.z+1.0) / (2.0)); 
        gl_Position = modelViewProjectionMatrix * paux;
    }

    else if (mirallx) {
        paux = mat4(vec4(cos(PI/2.0), sin(PI/2.0), 0,0), vec4(-sin(PI/2.0), cos(PI/2.0), 0, 0), vec4(0,0,1, 0), vec4(0,0,0,1)) * paux; 
        paux.y = mix(boundingMin.y, boundingMax.y, (paux.y+1.0) / (2.0)); 
        paux.x = boundingMin.x;
        paux.z = mix(boundingMin.z, boundingMax.z, (paux.z+1.0) / (2.0)); 
        gl_Position = modelViewProjectionMatrix * paux;
    }

    else if (mirallz) {
        paux = mat4(vec4(1,0,0,0), vec4(0, cos(PI/2.0), sin(PI/2.0), 0), vec4(0, -sin(PI/2.0), cos(PI/2.0), 0), vec4(0,0,0,1)) * paux;
        paux.y = mix(boundingMin.y, boundingMax.y, (paux.y+1.0) / (2.0)); 
        paux.x = mix(boundingMin.x, boundingMax.x, (paux.x+1.0) / (2.0)); 
        paux.z = boundingMin.z;
        gl_Position = modelViewProjectionMatrix * paux;
    }

}

