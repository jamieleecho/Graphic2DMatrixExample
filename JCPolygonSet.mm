//
//  JCPolygonSet.mm
//  Graphic2DMatrixExample
//
//  Created by Jamie Cho on 2010-11-14.
//  Copyright 2010 Jamie Cho. All rights reserved.
//

#import "JCPolygonSet.h"
#import "JCPolygon.h"

@implementation JCPolygonSet

@synthesize polygons;
@synthesize invert;

static double simpleFunction(double t) {
  return (t * (t - 2 * M_PI))/(M_PI*M_PI);
}

static double scaleXFunction(double t) {
  return 2 - 4 * simpleFunction(t);
}

static double scaleYFunction(double t) {
  return 1 + 2 * cos(t);
}

static double translateXFunction(double t) {
  return -30 * simpleFunction(t);
}

static double translateYFunction(double t) {
  return 20 * sin(t);
}

static jcho::Matrix<double> rotationMatrix(double angle) {
  jcho::Matrix<double> transform(3, 3, jcho::Identity);
  transform.set(0, 0, cos(angle));
  transform.set(1, 1, cos(angle));
  transform.set(0, 1, -sin(angle));
  transform.set(1, 0, sin(angle));
  return transform;
}

static jcho::Matrix<double> translationMatrix(double x, double y) {
  jcho::Matrix<double> transform(3, 3, jcho::Identity);
  transform.set(0, 2, x);
  transform.set(1, 2, y);
  return transform;
}

static jcho::Matrix<double> scaleMatrix(double x, double y) {
  jcho::Matrix<double> transform(3, 3, jcho::Identity);
  transform.set(0, 0, x);
  transform.set(1, 1, y);
  return transform;
}


-(id)init {
  if (self = [super init]) {
    polygons = [[NSMutableSet alloc] init];
    [polygons addObject:[JCPolygon squarePolygonWithPosition:NSMakePoint(0, 0) andSize:20]];
    [polygons addObject:[JCPolygon starPolygonWithPosition:NSMakePoint(-100, 0) andSize:80]];
    [polygons addObject:[JCPolygon rectanglePolygonWithPosition:NSMakePoint(100, 100) andSize:NSMakeSize(100, 20)]];
    [polygons addObject:[JCPolygon squarePolygonWithPosition:NSMakePoint(70, -70) andSize:50]];
    [polygons addObject:[JCPolygon starPolygonWithPosition:NSMakePoint(70, -70) andSize:50]];
    [polygons addObject:[JCPolygon starPolygonWithPosition:NSMakePoint(-40, -80) andSize:30]];
    [polygons addObject:[JCPolygon starPolygonWithPosition:NSMakePoint(-40, -80) andSize:30]];
    [polygons addObject:[JCPolygon starPolygonWithPosition:NSMakePoint(0, -400) andSize:60]];
    [polygons addObject:[JCPolygon starPolygonWithPosition:NSMakePoint(0, 200) andSize:20]];
  }
  return self;
}


-(void)dealloc {
  [polygons release];
  [super dealloc];
}
  

-(NSSet *)polygonsAtTimeStep {
  jcho::Matrix<double> transform = [self transformAtTimeStep];

  NSMutableSet *transformedPolygons = [[[NSMutableSet alloc] initWithCapacity:[polygons count]] autorelease];
  for(JCPolygon *polygon in polygons) {
    JCPolygon *transformedPolygon = [[[JCPolygon alloc] initWithPolygon:polygon andTransform:transform] autorelease];
    [transformedPolygons addObject:transformedPolygon];
  }
  
  return transformedPolygons;
}


-(jcho::Matrix<double>)transformAtTimeStep {
  jcho::Matrix<double> transform = rotationMatrix(timeStep) * translationMatrix(translateXFunction(timeStep), translateYFunction(timeStep)) * scaleMatrix(scaleXFunction(timeStep), scaleYFunction(timeStep));
  if (invert) return transform.inversion();
  return transform;
}


-(double)timeStep { return timeStep; }

-(void) setTimeStep:(double)newTimeStep {
  newTimeStep = fabs(newTimeStep);
  timeStep = newTimeStep - ((2 * M_PI) * (int)((newTimeStep / (2 * M_PI))));
}
  
@end

