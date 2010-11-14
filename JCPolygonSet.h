//
//  JCPolygonSet.h
//  Graphic2DMatrixExample
//
//  Created by Jamie Cho on 2010-11-14.
//  Copyright 2010 Jamie Cho. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include "Matrix.h"

@interface JCPolygonSet : NSObject {
  @private NSMutableSet *polygons;
  @private double timeStep;
  @private BOOL invert;
}

@property(readonly, retain) NSSet *polygons;
@property(readwrite, assign) double timeStep;
@property(readwrite, assign) BOOL invert;

-(NSSet *)polygonsAtTimeStep;
-(jcho::Matrix<double>)transformAtTimeStep;

@end
