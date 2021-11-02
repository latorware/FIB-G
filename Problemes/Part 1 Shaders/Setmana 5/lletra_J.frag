#version 330 core

in vec2 vtexCoord;

out vec4 fragColor;

uniform float time;



// punt interior a cercle

bool inCircle(vec2 p, vec2 c, float r)

{

	return (distance(p, c) <= r);

}



// punt interior a rectangle

bool inRect(vec2 p, vec2 m, vec2 M)

{

	return  (p.x >= m.x && p.x <= M.x) && (p.y >= m.y && p.y <= M.y);

}



void main()

{

	float r = 1.5; // radi cercle petit

	float R = 3;   // radi cercle gran

	// escalem i centrem per treballar en [-5, 5] x [-5, 5]

	vec2 p = 10*vtexCoord - vec2(5);  

	fragColor = vec4(0); // color per defecte

	// part inferior de la "J"

	if (inCircle(p, vec2(0, -1), R) && !inCircle(p, vec2(0, -1), r) && p.y<=-1) 

		fragColor = vec4(1);

	// segment vertical

	if (inRect(p, vec2(r,-1), vec2(R, 4)))  fragColor = vec4(1);

}