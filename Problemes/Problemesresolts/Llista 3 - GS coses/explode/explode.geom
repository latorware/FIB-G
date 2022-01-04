#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;
in vec3 normalinobject[];
uniform float speed = 1.2; 
uniform float time; 
uniform mat4 modelViewProjectionMatrix; 

void main( void )
{
	vec3 normal = (normalinobject[0] + normalinobject[1]+ normalinobject[2])/3.0; 
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = vec4(speed * time * normal, 1) + gl_in[i].gl_Position;
		gl_Position = modelViewProjectionMatrix * gl_Position; 
		EmitVertex();
	}
    EndPrimitive();
}
