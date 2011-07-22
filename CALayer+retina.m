//
//  CALayer+retina.m
//
//  Created by Kaz Yoshikawa on 10/11/08.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import "CALayer+Retina.h"


@implementation CALayer (Retina)

- (CGFloat)contentsScale_
{
	if ([self respondsToSelector:@selector(contentsScale)]) {
		return self.contentsScale;
	}
	return 1.0f;
}

- (void)setContentsScale_:(CGFloat)aContentsScale
{
	if ([self respondsToSelector:@selector(setContentsScale:)]) {
		self.contentsScale = aContentsScale;
	}
}

@end
