#version 330 core

uniform sampler2D colorMap; 
out vec4 fragColor;
in vec2 vtexCoord; 

void main()
{
    int columna = int(vtexCoord.s*15.0); 
    int fila = int(vtexCoord.t*15.0); 

        //primer conversions
        vec2 vtexCoordd = vtexCoord; 
        vtexCoordd.x = vtexCoordd.x / 6.0; 
        vtexCoordd.y = vtexCoordd.y * 15.0; 
        vtexCoordd.x = vtexCoordd.x * 15.0; 
        fragColor = texture(colorMap, vtexCoordd); 
        //descomentar tot lo demes per veure com es


        if (columna == 0 && fila == 0) {
            vtexCoordd.x = (5/6.0) - vtexCoordd.x; //esta invertit
            vtexCoordd.y = 1 - vtexCoordd.y; //esta invertit
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (columna == 0 && fila == 14) {
            vtexCoordd.x = (5/6.0) - vtexCoordd.x; //esta invertit
            float a = vtexCoordd.y; 
            vtexCoordd.y = mix(0,1,(vtexCoordd.x-(columna/6.0))/(1/6.0)); 
            vtexCoordd.x = mix(3/6.0, 4/6.0, fract(a)); 

            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (columna == 14 && fila == 14) {
            vtexCoordd.x = vtexCoordd.x - (10/6.0); 
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (columna == 14 && fila == 0) {
            vtexCoordd.x = vtexCoordd.x - (4/6.0); 
            vtexCoordd.y = 1 - vtexCoordd.y; //esta invertit
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (columna == 0) {
            vtexCoordd.x = vtexCoordd.x + (3/6.0); 
            float a = vtexCoordd.y; 
            vtexCoordd.y = mix(0,1,(vtexCoordd.x-(columna/6.0))/(1/6.0)); 
            vtexCoordd.x = mix(3/6.0, 4/6.0, fract(a)); 
            fragColor = texture(colorMap, vtexCoordd); 
        } 

        else if (columna == 14) {
            vtexCoordd.x = vtexCoordd.x + (-5/6.0); 
            float a = vtexCoordd.y; 
            vtexCoordd.y = mix(0,1,(vtexCoordd.x-(columna/6.0))/(1/6.0)); 
            vtexCoordd.x = mix(3/6.0, 4/6.0, fract(a)); 
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (fila == 14) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (3/6.0); 
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (fila == 0) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (3/6.0); 
            fragColor = texture(colorMap, vtexCoordd); 
        }


        else if (columna == 4 && fila == 1) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (1/6.0); 
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (columna == 5 && fila == 1) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (0/6.0); 
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (fila == 1) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (5/6.0); 
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (columna == 1) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (5/6.0); 
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (columna == 13) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (5/6.0); 
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (fila == 13) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (5/6.0); 
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (fila == 7) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (5/6.0); 
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (columna == 7) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (5/6.0); 
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (columna == 2) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (3/6.0); 
            float a = vtexCoordd.y; 
            vtexCoordd.y = mix(0,1,(vtexCoordd.x-(columna/6.0))/(1/6.0)); 
            vtexCoordd.x = mix(3/6.0, 4/6.0, fract(a)); 
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (columna == 3) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (5/6.0); 
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (columna == 4) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (3/6.0);
            float a = vtexCoordd.y; 
            vtexCoordd.y = mix(0,1,(vtexCoordd.x-(columna/6.0))/(1/6.0)); 
            vtexCoordd.x = mix(3/6.0, 4/6.0, fract(a));  
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (columna == 6) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (3/6.0); 
            float a = vtexCoordd.y; 
            vtexCoordd.y = mix(0,1,(vtexCoordd.x-(columna/6.0))/(1/6.0)); 
            vtexCoordd.x = mix(3/6.0, 4/6.0, fract(a));  
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (columna == 8) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (3/6.0); 
            float a = vtexCoordd.y; 
            vtexCoordd.y = mix(0,1,(vtexCoordd.x-(columna/6.0))/(1/6.0)); 
            vtexCoordd.x = mix(3/6.0, 4/6.0, fract(a));  
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (columna == 9) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (5/6.0); 
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (columna == 11) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (5/6.0); 
            fragColor = texture(colorMap, vtexCoordd); 
        }

        else if (columna == 10) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (3/6.0); 
            float a = vtexCoordd.y; 
            vtexCoordd.y = mix(0,1,(vtexCoordd.x-(columna/6.0))/(1/6.0)); 
            vtexCoordd.x = mix(3/6.0, 4/6.0, fract(a));  
            fragColor = texture(colorMap, vtexCoordd); 
        }



        else if (columna == 12) {
            vtexCoordd.x = vtexCoordd.x - (columna/6.0) + (3/6.0); 
            float a = vtexCoordd.y; 
            vtexCoordd.y = mix(0,1,(vtexCoordd.x-(columna/6.0))/(1/6.0)); 
            vtexCoordd.x = mix(3/6.0, 4/6.0, fract(a));  
            fragColor = texture(colorMap, vtexCoordd); 
        }



    
}
 