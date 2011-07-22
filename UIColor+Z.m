//
//  UIColor+Z.m
//
//  Created by Kaz Yoshikawa on 11/04/21.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import "UIColor+Z.h"
#import "ZColorUtils.h"


@implementation UIColor (Z)

+ (UIColor *)colorWithString:(NSString *)aString
{
	if ([aString isKindOfClass:[NSString class]]) {
		return UIColorFromZRGBA(ZRGBAFromString(aString));
	}
	return nil;
}

@end
