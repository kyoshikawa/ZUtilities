//
//  UIScreen+retina.m
//
//  Created by Kaz Yoshikawa on 10/10/18.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import "UIScreen+retina.h"


@implementation UIScreen (retina)

- (CGFloat)scale_
{
	if ([self respondsToSelector:@selector(scale)]) {
		return self.scale;
	}
	return 1.0;
}

@end
