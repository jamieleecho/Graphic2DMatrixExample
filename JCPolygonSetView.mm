//
//  JCPolygonSetView.mm
//  Graphic2DMatrixExample
//
//  Created by Jamie Cho on 2010-11-14.
//  Copyright 2010 Jamie Cho. All rights reserved.
//

#import <OpenGL/OpenGl.h>
#import <OpenGL/gl.h>
#import "JCPolygonSetView.h"
#import "JCPolygon.h"

@implementation JCPolygonSetView

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    NSSize size = self.bounds.size;

	// Set the new viewport size
	glViewport(0, 0, (GLint)(size.width * self.window.backingScaleFactor), (GLint)(size.height * self.window.backingScaleFactor));
    
	// Choose the projection matrix to be the matrix 
	// manipulated by the following calls
	glMatrixMode(GL_PROJECTION);
    
	// Set the projection matrix to be the identity matrix
	glLoadIdentity();
    
	// Define the dimensions of the Orthographic Viewing Volume
    glOrtho(-size.width/2, size.width/2, size.height/2, -size.height/2, -8, 8.0);

	// Clear the RGB buffer and the depth buffer
    glColor3f(1.0, 1.0, 1.0);
    glBegin(GL_QUADS);
    glVertex2f(-size.width/2, size.width/2);
    glVertex2f(size.width/2, size.width/2);
    glVertex2f(size.width/2, -size.width/2);
    glVertex2f(-size.width/2, -size.width/2);
    glEnd();
    
    // Draw Blue crosshair
    glColor3f(0, 0, 1);
    glBegin(GL_LINES);
    glVertex2f(0, size.height/2);
    glVertex2f(0, -size.height/2);
    glVertex2f(size.width/2, 0);
    glVertex2f(-size.width/2, 0);
    glEnd();
    
    glColor3f(0, 0, 0);

    // Draw individual polygons
    for(JCPolygon *polygon in [polygons polygonsAtTimeStep]) {
        const std::vector<jcho::Matrix<double> > &points = [polygon points];
        if (points.size() == 0) continue;

        glBegin(GL_LINE_LOOP);
        for(std::vector<jcho::Matrix<double> >::const_iterator it = points.begin(); it!=points.end(); ++it) {
            NSPoint point = NSMakePoint((float)(*it).get(0, 0), (float)(*it).get(1, 0));    
            glVertex2f(point.x, point.y);
        }
        glEnd();
    }

    glFlush();
}

@end
