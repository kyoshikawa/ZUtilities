//
//  UIView+Z.m
//
//  Created by Kaz Yoshikawa on 11/01/15.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import "UIView+Z.h"


//
//	UIView (Z)
//
@implementation UIView (Z)

- (UIView *)findFirstResponder
{
	if ([self isFirstResponder]) {
		return self;
	}

	for (UIView *subview in self.subviews) {
		UIView *responder = [subview findFirstResponder];
		if (responder) {
			return responder;
		}
	}
	return nil;
}

- (UIViewController *)findViewController
{
	UIResponder *responder = self;
	while ((responder = [responder nextResponder])) {
		if ([responder isKindOfClass:[UIViewController class]]) {
			return (UIViewController *)responder;
		}
	}
	return nil;
}

@end
