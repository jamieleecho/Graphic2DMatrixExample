//
//  JCPolygon.mm
//  Graphic2DMatrixExample
//
//  Created by Jamie Cho on 2010-11-14.
//  Copyright 2010 Jamie Cho. All rights reserved.
//

#import "JCPolygon.h"


@implementation JCPolygon

static jcho::Matrix<double> makePoint(double x, double y) {
  jcho::Matrix<double> point(3, 1);
  point.set(0, 0, x);
  point.set(1, 0, y);
  point.set(2, 0, 1);
  return point;
}

+(JCPolygon *)squarePolygonWithPosition:(NSPoint)position andSize:(float)size {
  return [self rectanglePolygonWithPosition:position andSize:NSMakeSize(size, size)];
}

+(JCPolygon *)rectanglePolygonWithPosition:(NSPoint)position andSize:(NSSize)size {
  std::vector<jcho::Matrix<double> > points;
  points.push_back(makePoint(position.x - size.width/2, position.y - size.height/2));
  points.push_back(makePoint(position.x + size.width/2, position.y - size.height/2));
  points.push_back(makePoint(position.x + size.width/2, position.y + size.height/2));
  points.push_back(makePoint(position.x - size.width/2, position.y + size.height/2));
  return [[[JCPolygon alloc] initWithPoints:points] autorelease];
}

+(JCPolygon *)starPolygonWithPosition:(NSPoint)position andSize:(float)size {
  std::vector<jcho::Matrix<double> > points;
  points.push_back(makePoint(position.x - size * .25, position.y - size/2));
  points.push_back(makePoint(position.x, position.y + size/2));
  points.push_back(makePoint(position.x + size * .25, position.y - size/2));
  points.push_back(makePoint(position.x - size / 2, position.y + size * .15));
  points.push_back(makePoint(position.x + size / 2, position.y + size * .15));
  return [[[JCPolygon alloc] initWithPoints:points] autorelease];
}

-(id)initWithPoints:(const std::vector<jcho::Matrix<double> > &)thePoints {
  if (self = [super init]) {
    points = new std::vector<jcho::Matrix<double> >(thePoints);
  }
  
  return self;
}

-(id)initWithPolygon:(JCPolygon *)polygon andTransform:(const jcho::Matrix<double> &)transform {
  std::vector<jcho::Matrix<double> > thePoints = [polygon points];
  for(std::vector<jcho::Matrix<double> >::iterator it = thePoints.begin(); it!=thePoints.end(); ++it) {
    jcho::Matrix<double> point = *it;
    jcho::Matrix<double> transformedPoint = transform * point;
    *it = transformedPoint;
  }
  return [self initWithPoints:thePoints];
}

-(id)init {
  return [self initWithPoints:std::vector<jcho::Matrix<double> >()];
}

-(void)dealloc {
  delete points;
  [super dealloc];
}

-(const std::vector<jcho::Matrix<double> > &)points { return *points; }

@end
