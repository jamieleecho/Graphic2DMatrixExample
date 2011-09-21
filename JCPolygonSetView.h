//
//  JCPolygonSetView.h
//  Graphic2DMatrixExample
//
//  Created by Jamie Cho on 2010-11-14.
//  Copyright 2010 Jamie Cho. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "JCPolygonSet.h"

@interface JCPolygonSetView : NSOpenGLView {
    IBOutlet JCPolygonSet *polygons;
}

@end
