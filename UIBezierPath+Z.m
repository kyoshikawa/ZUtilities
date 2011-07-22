//
//  UIBezierPath+Z.m
//
//  Created by Kaz Yoshikawa on 11/03/07.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import "UIBezierPath+Z.h"


@implementation UIBezierPath (Z)

- (void)fillLinearGradient:(CGGradientRef)aGradientRef startPoint:(CGPoint)startPt endPoint:(CGPoint)endPt
{
	CGContextRef contextRef = UIGraphicsGetCurrentContext();
	CGContextSaveGState(contextRef);
	CGGradientDrawingOptions options = kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation;
	CGContextAddPath(contextRef, self.CGPath);
	CGContextClip(contextRef);
	CGContextDrawLinearGradient(contextRef, aGradientRef, startPt, endPt, options);
	CGContextRestoreGState(contextRef);
}

@end
