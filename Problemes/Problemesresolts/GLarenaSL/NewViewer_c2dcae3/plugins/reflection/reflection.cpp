#include "reflection.h"
#include "glwidget.h"

void Reflection::onPluginLoad()
{
	GLWidget &g = *glwidget();

	m_pVs = new QOpenGLShader(QOpenGLShader::Vertex, this);
    m_pVs->compileSourceFile("./reflection.vert");

	m_pFs = new QOpenGLShader(QOpenGLShader::Fragment, this);
    m_pFs->compileSourceFile("./reflection.frag");

	m_pProgram = new QOpenGLShaderProgram(this);
    m_pProgram->addShader(m_pVs);
    m_pProgram->addShader(m_pFs);
    m_pProgram->link();


    g.glActiveTexture(GL_TEXTURE0);
    g.glGenTextures( 1, &m_textureId0);
    g.glBindTexture(GL_TEXTURE_2D, m_textureId0);
    g.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    g.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    g.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR );
    g.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR );
    g.glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, glwidget()->width(), glwidget()->height(), 0, GL_RGB, GL_FLOAT,
                 NULL);
    g.glBindTexture(GL_TEXTURE_2D, 0);


	    g.glActiveTexture(GL_TEXTURE1);
    g.glGenTextures( 1, &m_textureId1);
    g.glBindTexture(GL_TEXTURE_2D, m_textureId1);
    g.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    g.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    g.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR );
    g.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR );
    g.glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, glwidget()->width(), glwidget()->height(), 0, GL_RGB, GL_FLOAT,
                 NULL);
    g.glBindTexture(GL_TEXTURE_2D, 0);


		    g.glActiveTexture(GL_TEXTURE2);
    g.glGenTextures( 1, &m_textureId2);
    g.glBindTexture(GL_TEXTURE_2D, m_textureId2);
    g.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    g.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    g.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR );
    g.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR );
    g.glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, glwidget()->width(), glwidget()->height(), 0, GL_RGB, GL_FLOAT,
                 NULL);
    g.glBindTexture(GL_TEXTURE_2D, 0);

    g.glGenVertexArrays(1, &m_VAO_rect);
    g.glBindVertexArray(m_VAO_rect);

	    float coords[] = { -1, -1, -1,
                       1,  -1, -1,
                       -1,  -1,  1,
                       1,  -1,  1 };

    GLuint VBO_coords;
    g.glGenBuffers(1, &VBO_coords);
    g.glBindBuffer(GL_ARRAY_BUFFER, VBO_coords);
    g.glBufferData(GL_ARRAY_BUFFER, sizeof(coords), coords, GL_STATIC_DRAW);
    g.glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, 0);
    g.glEnableVertexAttribArray(0);
    g.glBindVertexArray(0);


}






bool Reflection::paintGL()
{
	GLWidget &g = *glwidget();
	//g.glClearColor(0,0,0,0);
	g.glClearColor(1,1,1,1);
	g.glClear(GL_DEPTH_BUFFER_BIT | GL_COLOR_BUFFER_BIT);
    m_pProgram->bind();
    m_pProgram->setUniformValue("colorMap0", 0);
	m_pProgram->setUniformValue("colorMap1", 1);
	m_pProgram->setUniformValue("colorMap2", 2);
    m_pProgram->setUniformValue("SIZE", QVector2D(glwidget()->width(), glwidget()->height()));

	Box b = scene()->boundingBox();
    m_pProgram->setUniformValue("radius", b.radius());
    m_pProgram->setUniformValue("boundingMin", b.min());
    m_pProgram->setUniformValue("boundingMax", b.max());

	m_pProgram->setUniformValue("modelViewProjectionMatrix",
                                camera()->projectionMatrix() *
                                camera()->viewMatrix());
    m_pProgram->setUniformValue("modelViewMatrix", camera()->viewMatrix());
    m_pProgram->setUniformValue("normalMatrix", camera()->viewMatrix().normalMatrix());

	m_pProgram->setUniformValue("lightAmbient", QVector4D(1., 1., 1., 1.));
    m_pProgram->setUniformValue("lightDiffuse", QVector4D(1., 1., 1., 1.));
    m_pProgram->setUniformValue("lightSpecular", QVector4D(1., 1., 1., 1.));
    m_pProgram->setUniformValue("lightPosition", QVector4D(100., 100., 100., 1.));

	m_pProgram->setUniformValue("matAmbient", QVector4D(.5, .4, .0, 1.));
    m_pProgram->setUniformValue("matDiffuse", QVector4D(.5, .4, .0, 1.));
    m_pProgram->setUniformValue("matSpecular", QVector4D(1., 1., 1., 1.));
    m_pProgram->setUniformValue("matShininess", (float) 30.);


	//PASS 1: reflexiobaix  
	m_pProgram->setUniformValue("reflexiobaix", true);
	m_pProgram->setUniformValue("reflexiox", false);
	m_pProgram->setUniformValue("reflexioz", false);
	m_pProgram->setUniformValue("real", false);
	m_pProgram->setUniformValue("mirallbaix", false);
	m_pProgram->setUniformValue("mirallx", false);
	m_pProgram->setUniformValue("mirallz", false);
 
	drawPlugin()->drawScene();    

	// Get texture 
	g.glActiveTexture(GL_TEXTURE0); 
    g.glBindTexture(GL_TEXTURE_2D, m_textureId0);
    g.glCopyTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, 0, 0, glwidget()->width(), glwidget()->height());
    g.glGenerateMipmap(GL_TEXTURE_2D);
	//g.glClearColor(0,0,0,0);
	g.glClear(GL_DEPTH_BUFFER_BIT | GL_COLOR_BUFFER_BIT);

	//PASS 1: reflexiox 
	m_pProgram->setUniformValue("reflexiobaix", false);
	m_pProgram->setUniformValue("reflexiox", true);
	m_pProgram->setUniformValue("reflexioz", false);
	m_pProgram->setUniformValue("real", false);
	m_pProgram->setUniformValue("mirallbaix", false);
	m_pProgram->setUniformValue("mirallx", false);
	m_pProgram->setUniformValue("mirallz", false);
  
	drawPlugin()->drawScene(); 

	// Get texture
	g.glActiveTexture(GL_TEXTURE1);
    g.glBindTexture(GL_TEXTURE_2D, m_textureId1);
    g.glCopyTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, 0, 0, glwidget()->width(), glwidget()->height());
    g.glGenerateMipmap(GL_TEXTURE_2D);
	//g.glClearColor(0,0,0,0);
	g.glClear(GL_DEPTH_BUFFER_BIT | GL_COLOR_BUFFER_BIT);

		//PASS 1: reflexioz
	m_pProgram->setUniformValue("reflexiobaix", false);
	m_pProgram->setUniformValue("reflexiox", false);
	m_pProgram->setUniformValue("reflexioz", true);
	m_pProgram->setUniformValue("real", false);
	m_pProgram->setUniformValue("mirallbaix", false);
	m_pProgram->setUniformValue("mirallx", false);
	m_pProgram->setUniformValue("mirallz", false);
 
	drawPlugin()->drawScene(); 

	// Get texture
	g.glActiveTexture(GL_TEXTURE2);
    g.glBindTexture(GL_TEXTURE_2D, m_textureId2);
    g.glCopyTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, 0, 0, glwidget()->width(), glwidget()->height());
    g.glGenerateMipmap(GL_TEXTURE_2D);
	g.glClear(GL_DEPTH_BUFFER_BIT | GL_COLOR_BUFFER_BIT);



	// Pass 2 :real
    g.glClear(GL_DEPTH_BUFFER_BIT | GL_COLOR_BUFFER_BIT);
	m_pProgram->setUniformValue("reflexiobaix", false);
	m_pProgram->setUniformValue("reflexiox", false);
	m_pProgram->setUniformValue("reflexioz", false);
	m_pProgram->setUniformValue("real", true);
	m_pProgram->setUniformValue("mirallbaix", false);
	m_pProgram->setUniformValue("mirallx", false);
	m_pProgram->setUniformValue("mirallz", false);
	drawPlugin()->drawScene();

	// Pass 3 :mirallbaix
	m_pProgram->setUniformValue("reflexiobaix", false);
	m_pProgram->setUniformValue("reflexiox", false);
	m_pProgram->setUniformValue("reflexioz", false);
	m_pProgram->setUniformValue("real", false);
	m_pProgram->setUniformValue("mirallbaix", true);
	m_pProgram->setUniformValue("mirallx", false);
	m_pProgram->setUniformValue("mirallz", false);
    g.glBindVertexArray(m_VAO_rect);
    g.glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    g.glBindVertexArray(0);


	// Pass 3 :mirallx
	m_pProgram->setUniformValue("reflexiobaix", false);
	m_pProgram->setUniformValue("reflexiox", false);
	m_pProgram->setUniformValue("reflexioz", false);
	m_pProgram->setUniformValue("real", false);
	m_pProgram->setUniformValue("mirallbaix", false);
	m_pProgram->setUniformValue("mirallx", true);
	m_pProgram->setUniformValue("mirallz", false);
    g.glBindVertexArray(m_VAO_rect);
    g.glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    g.glBindVertexArray(0);
 
	// Pass 3 :mirallz 
	m_pProgram->setUniformValue("reflexiobaix", false);
	m_pProgram->setUniformValue("reflexiox", false);
	m_pProgram->setUniformValue("reflexioz", false);
	m_pProgram->setUniformValue("real", false);
	m_pProgram->setUniformValue("mirallbaix", false);
	m_pProgram->setUniformValue("mirallx", false);
	m_pProgram->setUniformValue("mirallz", true);
    g.glBindVertexArray(m_VAO_rect);
    g.glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    g.glBindVertexArray(0); 
 
    m_pProgram->release();
	g.glActiveTexture(GL_TEXTURE0);
    g.glBindTexture(GL_TEXTURE_2D, 0);
	g.glActiveTexture(GL_TEXTURE1);
    g.glBindTexture(GL_TEXTURE_2D, 0);
	g.glActiveTexture(GL_TEXTURE2);
    g.glBindTexture(GL_TEXTURE_2D, 0);



	return true;
}


