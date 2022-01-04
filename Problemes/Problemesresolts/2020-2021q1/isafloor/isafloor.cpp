#include "isafloor.h"
#include "glwidget.h"

void Isafloor::onPluginLoad()
{
	float superficietotal = 0; 
	float superficia = 0; 
	GLWidget &g = *glwidget();
	const Object& a = scene()->objects()[0]; 
	for (int i = 0; i < a.faces().size(); i++) {
		//CALCUL DE LA ARIA
		const Face& cara = a.faces()[i]; 
		const Vertex& zero = a.vertices()[cara.vertexIndex(0)]; 
		const Vertex& one = a.vertices()[cara.vertexIndex(1)]; 
		const Vertex& two = a.vertices()[cara.vertexIndex(2)]; 
		const Vector onee = one.coord() - zero.coord(); 
		const Vector twoo = two.coord() - zero.coord(); 

		float area = (Vector::crossProduct(onee, twoo).length())/2.0; 

		//Per veure isafloor
		Vector normall = cara.normal().normalized(); 
		Vector dd = Vector(0.0, 0.0, 1.0); 
 
		float scalarroduct = Vector::dotProduct(normall, dd); 

		superficietotal = superficietotal + area; 

		if (scalarroduct > 0.7) {
			superficia = superficia + area; 
		}
	}

	percenatge = superficia / superficietotal; 

	cout << "TERRA: " << percenatge << endl; 


	m_pVs = new QOpenGLShader(QOpenGLShader::Vertex, this);
    m_pVs->compileSourceFile("./isafloor.vert");

	m_pFs = new QOpenGLShader(QOpenGLShader::Fragment, this);
    m_pFs->compileSourceFile("./isafloor.frag");

	m_pProgram = new QOpenGLShaderProgram(this); 
    m_pProgram->addShader(m_pVs);
    m_pProgram->addShader(m_pFs);
    m_pProgram->link();


} 

void Isafloor::preFrame()
{
	m_pProgram->bind();
	m_pProgram->setUniformValue("modelViewProjectionMatrix",
                                camera()->projectionMatrix() *
                                camera()->viewMatrix());
    m_pProgram->setUniformValue("normalMatrix", camera()->viewMatrix().normalMatrix());
	m_pProgram->setUniformValue("valorrr", percenatge); 
}

