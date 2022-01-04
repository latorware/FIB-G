#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[]; 
in vec2 vtexcoord[]; 

out vec2 gtexCoord; 

out vec4 gfrontColor; 


uniform float w = 0.3; 
uniform vec4 lightPosition; 
uniform mat4 projectionMatrix; 


void main( void )
{
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i]; 
		gtexCoord = vec2(-100.0,-100.0); 
		gl_Position = gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();

	if (gl_PrimitiveIDIn == 0) {
		vec4 lighttPosition = projectionMatrix * (lightPosition); 
		lighttPosition = lighttPosition / lightPosition.w*1.0; 

		gtexCoord = vec2(0.0,0.0); 
		gl_Position.x = lighttPosition.x - w;
		gl_Position.y = lighttPosition.y - w; 
		gl_Position.z = lighttPosition.z; 
		gl_Position.w = 1.0; 
		
		EmitVertex(); 

		gl_Position.x = lighttPosition.x - w;
		gl_Position.y = lighttPosition.y + w; 
		gl_Position.z = lighttPosition.z; 
		gl_Position.w = 1.0; 
		gtexCoord = vec2(0.0,1.0); 
		EmitVertex(); 

		gl_Position.x = lighttPosition.x + w;
		gl_Position.y = lighttPosition.y - w; 
		gl_Position.z = lighttPosition.z; 
		gl_Position.w = 1.0; 
		gtexCoord = vec2(1.0,0.0); 
		EmitVertex(); 

		gl_Position.x = lighttPosition.x + w;
		gl_Position.y = lighttPosition.y + w; 
		gl_Position.z = lighttPosition.z; 
		gl_Position.w = 1.0; 
		gtexCoord = vec2(1.0,1.0); 
		EmitVertex(); 
		EndPrimitive(); 
	}
}

