    #version 330 core
    layout (location=0) in vec3 vertex;
    layout (location=2) in vec3 color;
    uniform mat4 modelViewProjectionMatrix;
    uniform vec3 boundingBoxMin;
    uniform vec3 boundingBoxMax;
    out vec4 FrontColor;
    void main() {
       FrontColor=vec4(color, 1);
       vec3 vertexx; 
       vertexx.x = mix(boundingBoxMin.x, boundingBoxMax.x, (vertex.x) / (1.0)  ); 
       vertexx.y = mix(boundingBoxMin.y, boundingBoxMax.y, (vertex.y) / (1.0)  ); 
       vertexx.z = mix(boundingBoxMin.z, boundingBoxMax.z, (vertex.z) / (1.0)  ); 
       gl_Position = modelViewProjectionMatrix*(vec4(vertexx, 1.0)); 

       /*
       mat4 scale=mat4(vec4(boundingBoxMax.x-boundingBoxMin.x, 0, 0, 0),
           vec4(0, boundingBoxMax.y-boundingBoxMin.y, 0, 0),
           vec4(0, 0, boundingBoxMax.z-boundingBoxMin.z, 0),
           vec4(0, 0, 0, 1));
       vec4 centre=vec4((boundingBoxMax+boundingBoxMin)/2, 0);
       vec4 V=scale*vec4(vertex-vec3(0.5), 1);
       gl_Position=modelViewProjectionMatrix*(centre+V);
       */
	}