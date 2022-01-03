#ifndef _REFLECTION_H
#define _REFLECTION_H

#include "plugin.h" 
#include <QOpenGLShader>
#include <QOpenGLShaderProgram>


class Reflection: public QObject, public Plugin
{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "Plugin") 
	Q_INTERFACES(Plugin)

  public:
	 void onPluginLoad();

	 bool paintGL();
  private:
	// add private methods and attributes here
	QOpenGLShaderProgram *m_pProgram;
    QOpenGLShader *m_pVs;
    QOpenGLShader *m_pFs;  
    GLuint m_textureId0;
	GLuint m_textureId1;
	GLuint m_textureId2;
    GLuint m_VAO_rect;
};

#endif
