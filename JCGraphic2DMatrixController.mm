//
//  JCGraphic2DMatrixController.mm
//  Graphic2DMatrixExample
//
//  Created by Jamie Cho on 2010-11-14.
//  Copyright 2010 Jamie Cho. All rights reserved.
//

#import "JCGraphic2DMatrixController.h"


@implementation JCGraphic2DMatrixController

-(id) init {
  if (self = [super init]) {    
  }
  return self;
}

-(void) dealloc {
  [timer invalidate];
  [super dealloc];
}

-(void) awakeFromNib {
  [super awakeFromNib];
  [[self window] performZoom:self];
  timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
}

- (void)tick:(NSTimer*)theTimer {
  polygons.timeStep = polygons.timeStep + [timer timeInterval];
  [view setNeedsDisplay:YES];
}

@end
