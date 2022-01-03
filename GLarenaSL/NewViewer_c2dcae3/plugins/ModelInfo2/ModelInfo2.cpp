#include "ModelInfo2.h"
#include "glwidget.h"

void ModelInfo2::onPluginLoad()
{
}

void ModelInfo2::preFrame()
{
	
}

void ModelInfo2::postFrame()
{
	   QFont font;
  font.setPixelSize(32);
  painter.begin(glwidget());
  painter.setFont(font);
  int x = 15;
  int y = 40;
  painter.drawText(x, y, QString("L - Load object" 
				 "     A - Add plugin"));    
  painter.end();
}

void ModelInfo2::onObjectAdd()
{
	
}

bool ModelInfo2::drawScene()
{
	return false; // return true only if implemented
}

bool ModelInfo2::drawObject(int)
{
	return false; // return true only if implemented
}

bool ModelInfo2::paintGL()
{
	return false; // return true only if implemented
}

void ModelInfo2::keyPressEvent(QKeyEvent *)
{
	
}

void ModelInfo2::mouseMoveEvent(QMouseEvent *)
{
	
}

