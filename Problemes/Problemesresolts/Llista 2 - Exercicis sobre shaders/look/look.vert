#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec2 mousePosition; 
uniform float mouseOverrideX = -1; 
uniform vec2 viewport = vec2(800, 600); 

void main()
{
    float cursor_position; 
    if (mouseOverrideX < 0) {
        cursor_position = mousePosition.x;
    }
    else {
        cursor_position = mouseOverrideX; 
    }



    vec3 V = vertex; 
    vec3 N = normal; 

    if (vertex.y >= 1.45) {
        float alpha = (((cursor_position - 0.0)/(viewport.x)) * 2.0) - 1.0; 

        mat3 rotation_matrix = mat3(vec3(cos(alpha), 0, -sin(alpha)), vec3(0, 1, 0), vec3(sin(alpha), 0, cos(alpha))); 
        V = rotation_matrix * vertex;
        N = normalize(transpose(inverse(rotation_matrix)) * normal); 

        float interpolation = smoothstep(1.45, 1.55, vertex.y); 

        V = mix(vertex, V, interpolation);

        N = normalize(mix(normal, N, interpolation));  
    }



    N = normalize(normalMatrix * N);
    frontColor = vec4(vec3(N.z), 1.0);
    gl_Position = modelViewProjectionMatrix * vec4(V, 1.0);
}
