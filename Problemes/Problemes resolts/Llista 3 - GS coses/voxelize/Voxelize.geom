#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix; 

uniform float step = 0.1; 

void main( void )
{
	vec4 C = (gl_in[0].gl_Position + gl_in[1].gl_Position + gl_in[2].gl_Position) / 3.0;
	C /= step;  
	C.x = int(C.x); 
	C.y = int(C.y); 
	C.z = int(C.z); 
	C *= step; 
	C.w = 1; 
	gfrontColor = vec4(0.5, 0.5, 0.5, 1); 

	gl_Position.x = (C.x - (0.5*step)); 
	gl_Position.y = (C.y - (0.5*step)); 
	gl_Position.z = (C.z - (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	gl_Position.x = (C.x - (0.5*step)); 
	gl_Position.y = (C.y + (0.5*step)); 
	gl_Position.z = (C.z - (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	gl_Position.x = (C.x - (0.5*step)); 
	gl_Position.y = (C.y - (0.5*step)); 
	gl_Position.z = (C.z + (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	gl_Position.x = (C.x - (0.5*step)); 
	gl_Position.y = (C.y + (0.5*step)); 
	gl_Position.z = (C.z + (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	EndPrimitive();





	gl_Position.x = (C.x - (0.5*step)); 
	gl_Position.y = (C.y - (0.5*step)); 
	gl_Position.z = (C.z - (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	gl_Position.x = (C.x + (0.5*step)); 
	gl_Position.y = (C.y - (0.5*step)); 
	gl_Position.z = (C.z - (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	gl_Position.x = (C.x - (0.5*step)); 
	gl_Position.y = (C.y - (0.5*step)); 
	gl_Position.z = (C.z + (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	gl_Position.x = (C.x + (0.5*step)); 
	gl_Position.y = (C.y - (0.5*step)); 
	gl_Position.z = (C.z + (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	EndPrimitive();





	gl_Position.x = (C.x - (0.5*step)); 
	gl_Position.y = (C.y - (0.5*step)); 
	gl_Position.z = (C.z - (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	gl_Position.x = (C.x - (0.5*step)); 
	gl_Position.y = (C.y + (0.5*step)); 
	gl_Position.z = (C.z - (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	gl_Position.x = (C.x + (0.5*step)); 
	gl_Position.y = (C.y - (0.5*step)); 
	gl_Position.z = (C.z - (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	gl_Position.x = (C.x + (0.5*step)); 
	gl_Position.y = (C.y + (0.5*step)); 
	gl_Position.z = (C.z - (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	EndPrimitive();


	gl_Position.x = (C.x + (0.5*step)); 
	gl_Position.y = (C.y - (0.5*step)); 
	gl_Position.z = (C.z - (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	gl_Position.x = (C.x + (0.5*step)); 
	gl_Position.y = (C.y + (0.5*step)); 
	gl_Position.z = (C.z - (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	gl_Position.x = (C.x + (0.5*step)); 
	gl_Position.y = (C.y - (0.5*step)); 
	gl_Position.z = (C.z + (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	gl_Position.x = (C.x + (0.5*step)); 
	gl_Position.y = (C.y + (0.5*step)); 
	gl_Position.z = (C.z + (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	EndPrimitive();





	gl_Position.x = (C.x - (0.5*step)); 
	gl_Position.y = (C.y + (0.5*step)); 
	gl_Position.z = (C.z - (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	gl_Position.x = (C.x + (0.5*step)); 
	gl_Position.y = (C.y + (0.5*step)); 
	gl_Position.z = (C.z - (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	gl_Position.x = (C.x - (0.5*step)); 
	gl_Position.y = (C.y + (0.5*step)); 
	gl_Position.z = (C.z + (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	gl_Position.x = (C.x + (0.5*step)); 
	gl_Position.y = (C.y + (0.5*step)); 
	gl_Position.z = (C.z + (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	EndPrimitive();





	gl_Position.x = (C.x - (0.5*step)); 
	gl_Position.y = (C.y - (0.5*step)); 
	gl_Position.z = (C.z + (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	gl_Position.x = (C.x - (0.5*step)); 
	gl_Position.y = (C.y + (0.5*step)); 
	gl_Position.z = (C.z + (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	gl_Position.x = (C.x + (0.5*step)); 
	gl_Position.y = (C.y - (0.5*step)); 
	gl_Position.z = (C.z + (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	gl_Position.x = (C.x + (0.5*step)); 
	gl_Position.y = (C.y + (0.5*step)); 
	gl_Position.z = (C.z + (0.5*step)); 
	gl_Position.w = 1; 
	gl_Position = modelViewProjectionMatrix * gl_Position; 
	EmitVertex(); 

	EndPrimitive();


}
