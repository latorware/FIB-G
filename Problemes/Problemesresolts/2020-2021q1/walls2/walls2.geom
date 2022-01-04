#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewMatrixInverse; 
uniform mat4 modelViewProjectionMatrix; 
uniform vec3 boundingBoxMin; 
uniform vec3 boundingBoxMax; 

void main( void )
{
	bool multiplicar = false; 
	vec4 cameraenobject = modelViewMatrixInverse * vec4(0,0,0,1); 
	if (cameraenobject.x < boundingBoxMax.x && cameraenobject.y < boundingBoxMax.y && cameraenobject.z < boundingBoxMax.z && cameraenobject.x > boundingBoxMin.x && cameraenobject.y > boundingBoxMin.y && cameraenobject.z > boundingBoxMin.z ) {
		multiplicar = true; 
	}


	for( int i = 0 ; i < 3 ; i++ )
	{
		if (!multiplicar) {
			gfrontColor = vfrontColor[i]; 
		}
		else {
			gfrontColor = vfrontColor[i] * 2.0; 
		}
		gl_Position = gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();


	if (gl_PrimitiveIDIn == 0) {
		gfrontColor = vec4(1,0,0,1); 

		gl_Position.x = boundingBoxMin.x; 
		gl_Position.y = boundingBoxMin.y; 
		gl_Position.z = boundingBoxMin.z; 
		gl_Position.w = 1.0; 
		gl_Position = modelViewProjectionMatrix * gl_Position; 
		EmitVertex(); 

		gl_Position.x = boundingBoxMin.x; 
		gl_Position.y = boundingBoxMin.y; 
		gl_Position.z = boundingBoxMax.z; 
		gl_Position.w = 1.0; 
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();  

		gl_Position.x = boundingBoxMin.x; 
		gl_Position.y = boundingBoxMax.y; 
		gl_Position.z = boundingBoxMin.z; 
		gl_Position.w = 1.0; 
		gl_Position = modelViewProjectionMatrix * gl_Position; 
		EmitVertex(); 

		gl_Position.x = boundingBoxMin.x; 
		gl_Position.y = boundingBoxMax.y; 
		gl_Position.z = boundingBoxMax.z; 
		gl_Position.w = 1.0; 
		gl_Position = modelViewProjectionMatrix * gl_Position; 
		EmitVertex(); 
		EndPrimitive(); 

		gl_Position.x = boundingBoxMax.x; 
		gl_Position.y = boundingBoxMin.y; 
		gl_Position.z = boundingBoxMin.z; 
		gl_Position.w = 1.0; 
		gl_Position = modelViewProjectionMatrix * gl_Position; 
		EmitVertex(); 

		gl_Position.x = boundingBoxMax.x; 
		gl_Position.y = boundingBoxMin.y; 
		gl_Position.z = boundingBoxMax.z; 
		gl_Position.w = 1.0; 
		gl_Position = modelViewProjectionMatrix * gl_Position; 
		EmitVertex(); 

		gl_Position.x = boundingBoxMax.x; 
		gl_Position.y = boundingBoxMax.y; 
		gl_Position.z = boundingBoxMin.z; 
		gl_Position.w = 1.0; 
		gl_Position = modelViewProjectionMatrix * gl_Position; 
		EmitVertex(); 

		gl_Position.x = boundingBoxMax.x; 
		gl_Position.y = boundingBoxMax.y; 
		gl_Position.z = boundingBoxMax.z; 
		gl_Position.w = 1.0; 
		gl_Position = modelViewProjectionMatrix * gl_Position; 
		EmitVertex(); 
		EndPrimitive(); 

		gfrontColor = vec4(0,1,0,1); 

		gl_Position.x = boundingBoxMin.x; 
		gl_Position.y = boundingBoxMin.y; 
		gl_Position.z = boundingBoxMin.z; 
		gl_Position.w = 1.0; 
		gl_Position = modelViewProjectionMatrix * gl_Position; 
		EmitVertex(); 

		gl_Position.x = boundingBoxMin.x; 
		gl_Position.y = boundingBoxMin.y; 
		gl_Position.z = boundingBoxMax.z; 
		gl_Position.w = 1.0; 
		gl_Position = modelViewProjectionMatrix * gl_Position; 
		EmitVertex(); 

		
		gl_Position.x = boundingBoxMax.x; 
		gl_Position.y = boundingBoxMin.y; 
		gl_Position.z = boundingBoxMin.z; 
		gl_Position.w = 1.0; 
		gl_Position = modelViewProjectionMatrix * gl_Position; 
		EmitVertex(); 

		
		gl_Position.x = boundingBoxMax.x; 
		gl_Position.y = boundingBoxMin.y; 
		gl_Position.z = boundingBoxMax.z; 
		gl_Position.w = 1.0; 
		gl_Position = modelViewProjectionMatrix * gl_Position; 
		EmitVertex(); 
		EndPrimitive(); 

		gfrontColor = vec4(0,0,1,1); 

		gl_Position.x = boundingBoxMin.x; 
		gl_Position.y = boundingBoxMin.y; 
		gl_Position.z = boundingBoxMin.z; 
		gl_Position.w = 1.0; 
		gl_Position = modelViewProjectionMatrix * gl_Position; 
		EmitVertex(); 
		

		gl_Position.x = boundingBoxMin.x; 
		gl_Position.y = boundingBoxMax.y; 
		gl_Position.z = boundingBoxMin.z; 
		gl_Position.w = 1.0; 
		gl_Position = modelViewProjectionMatrix * gl_Position; 
		EmitVertex(); 

		gl_Position.x = boundingBoxMax.x; 
		gl_Position.y = boundingBoxMin.y; 
		gl_Position.z = boundingBoxMin.z; 
		gl_Position.w = 1.0; 
		gl_Position = modelViewProjectionMatrix * gl_Position; 
		EmitVertex(); 

		gl_Position.x = boundingBoxMax.x; 
		gl_Position.y = boundingBoxMax.y; 
		gl_Position.z = boundingBoxMin.z; 
		gl_Position.w = 1.0; 
		gl_Position = modelViewProjectionMatrix * gl_Position; 
		EmitVertex(); 
		EndPrimitive(); 
	}
}
