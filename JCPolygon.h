//
//  JCPolygon.h
//  Graphic2DMatrixExample
//
//  Created by Jamie Cho on 2010-11-14.
//  Copyright 2010 Jamie Cho, Johan Cho and Isabella Cho. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include <vector>
#include "Matrix.h"


@interface JCPolygon : NSObject {
  @private std::vector<jcho::Matrix<double> > points;
}

+(JCPolygon *)squarePolygonWithPosition:(NSPoint)position andSize:(float)size;
+(JCPolygon *)rectanglePolygonWithPosition:(NSPoint)position andSize:(NSSize)size;
+(JCPolygon *)starPolygonWithPosition:(NSPoint)position andSize:(float)size;
+(JCPolygon *)johanPolygonWithPosition:(NSPoint)position andSize:(NSSize)size;
+(JCPolygon *)isabellaPolygonWithPosition:(NSPoint)position andSize:(NSSize)size;

-(id)initWithPoints:(const std::vector<jcho::Matrix<double> > &)thePoints;
-(id)initWithPolygon:(JCPolygon *)polygon andTransform:(const jcho::Matrix<double> &)transform;
-(const std::vector<jcho::Matrix<double> > &)points;

@end
