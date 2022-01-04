#include "ModelInfo.h"
#include "glwidget.h"

void ModelInfo::printInfo()
 {
    Scene* sceneee = scene(); 
	const vector< Object > & objectess = sceneee->objects(); 
	cout << "Numero total objectes: " << objectess.size() << endl; 
	int totalpoligons = 0; 
	int totalvertexs = 0; 
	int totaltriangles = 0; 
	for (int i = 0; i < objectess.size(); i++) {
		totalvertexs += objectess[i].vertices().size(); 
		totalpoligons += objectess[i].faces().size(); 
		for (int j = 0; j < objectess[i].faces().size(); j++) {
			if (objectess[i].faces()[j].numVertices() == 3) {
				totaltriangles += 1; 
			}
		}
	}
	cout << "Numero total poligons: " << totalpoligons << endl; 
	cout << "Numero total vertexs: " << totalvertexs << endl; 
	cout << "Percentatge: " << totaltriangles/(totalpoligons*1.0) << endl; 
}


void ModelInfo::onPluginLoad()
{
	printInfo(); 
}

void ModelInfo::preFrame()
{
	
}

void ModelInfo::postFrame()
{
	//printInfo(); 
}

void ModelInfo::onObjectAdd()
{
	printInfo(); 
}

bool ModelInfo::drawScene()
{
 
	return false; // return true only if implemented
}

bool ModelInfo::drawObject(int)
{
	return false; // return true only if implemented
}

bool ModelInfo::paintGL()
{
	return false; // return true only if implemented
}

void ModelInfo::keyPressEvent(QKeyEvent *)
{
	
}

void ModelInfo::mouseMoveEvent(QMouseEvent *)
{
	
}

