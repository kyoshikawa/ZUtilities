//
//  UIView+retina.m
//
//  Created by Kaz Yoshiakwa on 10/10/18.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import "UIView+retina.h"


@implementation UIView (retina)

- (CGFloat)contentScaleFactor_
{
	if ([self respondsToSelector:@selector(contentScaleFactor)]) {
		return self.contentScaleFactor;
	}
	return 1.0f;
}

- (void)setContentScaleFactor_:(CGFloat)aFactor
{
	if ([self respondsToSelector:@selector(setContentScaleFactor:)]) {
		[self setContentScaleFactor:aFactor];
	}
}

@end
