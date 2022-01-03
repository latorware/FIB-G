#include "ShowDegree.h"
#include "glwidget.h"



void ShowDegree::imprimidora() {
  QFont font;
  font.setPixelSize(32);
  painter.begin(glwidget());
  painter.setFont(font);
  int x = 15;
  int y = 40;
  painter.drawText(x, y, QString::fromStdString(aimprimir));    
  painter.end();
}

void ShowDegree::onPluginLoad()
{
	const Object &obj = scene()->objects()[0];
	int totalvertexsss = obj.vertices().size(); 
	int totalvertexscares = (obj.faces().size())*3; 
	aimprimir = to_string(totalvertexscares/(totalvertexsss*1.0)); 
}

void ShowDegree::preFrame()
{
	
}

void ShowDegree::postFrame()
{
	imprimidora(); 
}

void ShowDegree::onObjectAdd()
{
	
}

bool ShowDegree::drawScene()
{
	return false; // return true only if implemented
}

bool ShowDegree::drawObject(int)
{
	return false; // return true only if implemented
}

bool ShowDegree::paintGL()
{
	return false; // return true only if implemented
}

void ShowDegree::keyPressEvent(QKeyEvent *)
{
	
}

void ShowDegree::mouseMoveEvent(QMouseEvent *)
{
	
}

