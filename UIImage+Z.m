//
//  UIImage+Z.m
//
//  Created by Kaz Yoshikawa on 10/10/25.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import "UIImage+Z.h"
#import "ZGeometricUtils.h"

//
//	UIImage (Z)
//
@implementation UIImage (Z)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor
{
	UIGraphicsBeginImageContext(self.size);
	CGRect drawRect = CGRectMake(0, 0, self.size.width, self.size.height);
	[self drawInRect:drawRect];
	[tintColor set];
	UIRectFillUsingBlendMode(drawRect, kCGBlendModeSourceAtop);
	UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return tintedImage;
}

@end
