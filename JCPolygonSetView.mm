//
//  JCPolygonSetView.mm
//  Graphic2DMatrixExample
//
//  Created by Jamie Cho on 2010-11-14.
//  Copyright 2010 Jamie Cho. All rights reserved.
//

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
  NSSize size = [self bounds].size;
  [self setBoundsOrigin:NSMakePoint(-size.width/2, -size.height/2)];
  [[NSColor whiteColor] setFill];
  [[NSColor blackColor] setStroke];
  [[NSBezierPath bezierPathWithRect:NSMakeRect(-size.width/2, -size.height/2, size.width, size.height)] fill];
  [[NSBezierPath bezierPathWithRect:NSMakeRect(-size.width/2, -size.height/2, size.width, size.height)] stroke];
  [[NSColor blueColor] setStroke];
  NSBezierPath *path = [NSBezierPath bezierPath];
  [path moveToPoint:NSMakePoint(0, size.height/2)];
  [path lineToPoint:NSMakePoint(0, -size.height/2)];
  [path moveToPoint:NSMakePoint(size.width/2, 0)];
  [path lineToPoint:NSMakePoint(-size.width/2, 0)];
  [path stroke];

  [[NSColor blackColor] setStroke];  
  path = [NSBezierPath bezierPath];
  for(JCPolygon *polygon in [polygons polygonsAtTimeStep]) {
    const std::vector<jcho::Matrix<double> > &points = [polygon points];
    if (points.size() == 0) continue;
    NSPoint firstPoint;
    for(std::vector<jcho::Matrix<double> >::const_iterator it = points.begin(); it!=points.end(); ++it) {
      NSPoint point = NSMakePoint((float)(*it).get(0, 0), (float)(*it).get(1, 0));    
      if (it == points.begin()) {
        firstPoint = point;
        [path moveToPoint:point];
      } else {
        [path lineToPoint:point];
      }
    }
    [path lineToPoint:firstPoint];
  }
  [path stroke];  
}

@end
