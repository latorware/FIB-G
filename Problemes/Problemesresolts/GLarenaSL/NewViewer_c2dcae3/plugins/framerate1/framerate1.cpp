#include "framerate1.h"
#include "glwidget.h"


void Framerate1::printFPS()
{
    cout << frames << endl;
    frames = 0;
}



void Framerate1::onPluginLoad()
{
	    frames=0;
    QTimer *frameTimer=new QTimer(this);
    connect(frameTimer, SIGNAL(timeout()), this, SLOT(printFPS()));
    frameTimer->start(1000);
}

void Framerate1::preFrame()
{
	
}

void Framerate1::postFrame()
{
	frames++;
}

void Framerate1::onObjectAdd()
{
	
}

bool Framerate1::drawScene()
{
	return false; // return true only if implemented
}

bool Framerate1::drawObject(int)
{
	return false; // return true only if implemented
}

bool Framerate1::paintGL()
{
	return false; // return true only if implemented
}

void Framerate1::keyPressEvent(QKeyEvent *)
{
	
}

void Framerate1::mouseMoveEvent(QMouseEvent *)
{
	
}

