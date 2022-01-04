#include "animateVertices.h"
#include "glwidget.h"

void AnimateVertices::onPluginLoad()
{
	QString vs_src="#version 330 core\nlayout (location=0) in vec3 vertex; layout (location=1) in vec3 normal; layout (location=2) in vec3 color; layout (location=3) in vec2 texCoord; out vec4 frontColor; out vec2 vtexCoord; uniform mat4 modelViewProjectionMatrix; uniform mat3 normalMatrix; uniform float time; uniform float amplitude=0.1; uniform float freq=1; const float PI=acos(-1.0); void main() { vec3 V=vertex+normal*abs(amplitude*sin(PI*2*freq*time)); vec3 N=normalize(normalMatrix*normal); frontColor=vec4(vec3(N.z),1); gl_Position=modelViewProjectionMatrix*vec4(V, 1); }";
	vs=new QOpenGLShader(QOpenGLShader::Vertex, this);
	vs->compileSourceCode(vs_src);
	QString fs_src="#version 330 core\nin vec4 frontColor; out vec4 fragColor; void main() { fragColor=frontColor; }";
	fs = new QOpenGLShader(QOpenGLShader::Fragment, this);
	fs->compileSourceCode(fs_src);
	program = new QOpenGLShaderProgram(this);
	program->addShader(vs);
	program->addShader(fs);	
	program->link();
	elapsedTimer.start();
	//QTimer *timer = new QTimer(this);
  	//connect(timer, SIGNAL(timeout()), glwidget(), SLOT(updateGL()));
	//timer->start();
}

void AnimateVertices::preFrame()
{
  program->bind();
  program->setUniformValue("time", float(elapsedTimer.elapsed()/1000.0f));
  cout << float(elapsedTimer.elapsed()/1000.0f) << endl; 
  QMatrix3x3 NM=camera()->viewMatrix().normalMatrix();
  program->setUniformValue("normalMatrix", NM); 
  QMatrix4x4 MVP=camera()->projectionMatrix()*camera()->viewMatrix();
  program->setUniformValue("modelViewProjectionMatrix", MVP); 
}

void AnimateVertices::postFrame()
{
	program->release();
}

void AnimateVertices::onObjectAdd()
{
	
}

bool AnimateVertices::drawScene()
{
	return false; // return true only if implemented
}

bool AnimateVertices::drawObject(int)
{
	return false; // return true only if implemented
}

bool AnimateVertices::paintGL()
{
	return false; // return true only if implemented
}

void AnimateVertices::keyPressEvent(QKeyEvent *)
{
	
}

void AnimateVertices::mouseMoveEvent(QMouseEvent *)
{
	
}

