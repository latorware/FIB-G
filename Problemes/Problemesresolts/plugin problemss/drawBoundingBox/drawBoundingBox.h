#ifndef _DRAW_VBO_EXT_H
#define _DRAW_VBO_EXT_H

#include <vector>
#include "basicplugin.h"

using namespace std;

class DrawBBox : public QObject, public BasicPlugin
{
  Q_OBJECT
#if QT_VERSION >= 0x050000
  Q_PLUGIN_METADATA(IID "BasicPlugin")   
#endif
  Q_INTERFACES(BasicPlugin)
  
public:
  ~DrawBBox();
  void cleanUp();
  void onPluginLoad();
  void onSceneClear();
  void postFrame();
  
private:
  
  GLuint m_VAO;           // ID of VAOs
  GLuint m_coordBufferID; // ID of vertex coordinates buffer 
  
  QGLShaderProgram* m_pProgram;
  QGLShader *m_pFs;
  QGLShader *m_pVs; 
  
  int m_size;
};

#endif


