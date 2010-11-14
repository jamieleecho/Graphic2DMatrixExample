//
//  JCPolygon.mm
//  Graphic2DMatrixExample
//
//  Created by Jamie Cho on 2010-11-14.
//  Copyright 2010 Jamie Cho, Johan Cho and Isabella Cho. All rights reserved.
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

+(JCPolygon *)johanPolygonWithPosition:(NSPoint)position andSize:(NSSize)size {
  std::vector<jcho::Matrix<double> > points;

  // Outer rectangle
  points.push_back(makePoint(position.x + .5 * size.width, position.y - .5 * size.height));
  points.push_back(makePoint(position.x - .5 * size.width, position.y - .5 * size.height));
  points.push_back(makePoint(position.x - .5 * size.width, position.y + .5 * size.height));
  points.push_back(makePoint(position.x + .5 * size.width, position.y + .5 * size.height));
  points.push_back(makePoint(position.x + .5 * size.width, position.y - .5 * size.height));

  // Inner rectangle
  points.push_back(makePoint(position.x + .3 * size.width, position.y - .25 * size.height));
  points.push_back(makePoint(position.x - .3 * size.width, position.y - .25 * size.height));
  points.push_back(makePoint(position.x - .3 * size.width, position.y + .25 * size.height));
  points.push_back(makePoint(position.x + .3 * size.width, position.y + .25 * size.height));
  points.push_back(makePoint(position.x + .3 * size.width, position.y - .25 * size.height));
  points.push_back(makePoint(position.x, position.y - .25 * size.height));

  // Inner circle
  points.push_back(makePoint(position.x, position.y - .25 * size.height));
  points.push_back(makePoint(position.x - .1 * size.width, position.y));
  points.push_back(makePoint(position.x, position.y + .25 * size.height));
  points.push_back(makePoint(position.x + .1 * size.width, position.y));
  points.push_back(makePoint(position.x, position.y - .25 * size.height));

  // Go back to origin
  points.push_back(makePoint(position.x + .3 * size.width, position.y - .25 * size.height));
  points.push_back(makePoint(position.x + .5 * size.width, position.y - .5 * size.height));

  return [[[JCPolygon alloc] initWithPoints:points] autorelease];
}

+(JCPolygon *)isabellaPolygonWithPosition:(NSPoint)position andSize:(NSSize)size {
  std::vector<jcho::Matrix<double> > points;
  // Head
  points.push_back(makePoint(position.x, position.y - size.height/2));
  points.push_back(makePoint(position.x + size.width/2, position.y));
  points.push_back(makePoint(position.x, position.y + size.height/2));
  points.push_back(makePoint(position.x - size.width/2, position.y));
  points.push_back(makePoint(position.x, position.y - size.height/2));

  // Left arm
  points.push_back(makePoint(position.x, position.y - size.height * .75));
  points.push_back(makePoint(position.x - size.width * .25, position.y - size.height * .65));
  points.push_back(makePoint(position.x, position.y - size.height * .75));

  // Left torso/leg
  points.push_back(makePoint(position.x + .15 * size.width, position.y - size.height * 1.75));
  points.push_back(makePoint(position.x + .65 * size.width, position.y - size.height * 1.75));
  points.push_back(makePoint(position.x + .15 * size.width, position.y - size.height * 1.75));
  points.push_back(makePoint(position.x + .05 * size.width, position.y - size.height * 1.85));

  // Left foot
  points.push_back(makePoint(position.x + .25 * size.width, position.y - size.height * 3.30));
  points.push_back(makePoint(position.x - .10 * size.width, position.y - size.height * 3.30));
  points.push_back(makePoint(position.x - .10 * size.width, position.y - size.height * 3.20));
  points.push_back(makePoint(position.x + .25 * size.width, position.y - size.height * 3.20));
  points.push_back(makePoint(position.x + .25 * size.width, position.y - size.height * 3.30));
  points.push_back(makePoint(position.x + .05 * size.width, position.y - size.height * 1.85));
  points.push_back(makePoint(position.x + .15 * size.width, position.y - size.height * 1.75));

  // Right leg
  points.push_back(makePoint(position.x + .65 * size.width, position.y - size.height * 1.75));
  points.push_back(makePoint(position.x + .62 * size.width, position.y - size.height * 1.75));
  points.push_back(makePoint(position.x + .55 * size.width, position.y - size.height * 2.25));

  // Right foot
  points.push_back(makePoint(position.x + .75 * size.width, position.y - size.height * 3.35));
  points.push_back(makePoint(position.x + 1.10 * size.width, position.y - size.height * 3.30));
  points.push_back(makePoint(position.x + 1.05 * size.width, position.y - size.height * 3.20));
  points.push_back(makePoint(position.x + .73 * size.width, position.y - size.height * 3.20));
  points.push_back(makePoint(position.x + .55 * size.width, position.y - size.height * 2.25));
  points.push_back(makePoint(position.x + .62 * size.width, position.y - size.height * 1.75));
  points.push_back(makePoint(position.x + .65 * size.width, position.y - size.height * 1.75));
  
  // Right torso/arm
  points.push_back(makePoint(position.x + .75 * size.width, position.y - size.height * 1.75));
  points.push_back(makePoint(position.x + .45 * size.width, position.y - size.height * .75));
  points.push_back(makePoint(position.x + .40 * size.width, position.y - size.height * .80));
  points.push_back(makePoint(position.x + .45 * size.width, position.y - size.height * .75));
  points.push_back(makePoint(position.x + .60 * size.width, position.y - size.height * .65));
  points.push_back(makePoint(position.x + .45 * size.width, position.y - size.height * .75));
  points.push_back(makePoint(position.x + .35 * size.width, position.y - size.height * .15));

  // Right hair
  points.push_back(makePoint(position.x, position.y - size.height/2));
  points.push_back(makePoint(position.x + size.width/2, position.y));
  points.push_back(makePoint(position.x, position.y + size.height/2));
  points.push_back(makePoint(position.x + .6 * size.width, position.y));
  points.push_back(makePoint(position.x + .7 * size.width, position.y - size.height * .75));
  points.push_back(makePoint(position.x + .6 * size.width, position.y));
  points.push_back(makePoint(position.x, position.y + size.height/2));

  // Left hair
  points.push_back(makePoint(position.x - .6 * size.width, position.y));
  points.push_back(makePoint(position.x - .7 * size.width, position.y - size.height * .75));
  points.push_back(makePoint(position.x - .6 * size.width, position.y));
  points.push_back(makePoint(position.x, position.y + size.height/2));

  // Go back to start
  points.push_back(makePoint(position.x + size.width/2, position.y));
  points.push_back(makePoint(position.x, position.y - size.height/2));
  
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
