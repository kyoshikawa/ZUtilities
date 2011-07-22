//
//  UIBezierPath+Z.h
//
//  Created by Kaz Yoshikawa on 11/03/07.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface UIBezierPath (Z)

- (void)fillLinearGradient:(CGGradientRef)aGradientRef startPoint:(CGPoint)startPt endPoint:(CGPoint)endPt;

@end
