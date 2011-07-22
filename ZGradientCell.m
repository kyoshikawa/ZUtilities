//
//  ZGradientCell.m
//
//  Created by Kaz Yoshikawa on 11/01/27.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import "ZGradientCell.h"


//
//	ZGradientCell
//
@implementation ZGradientCell

+ (Class)layerClass
{
	return [CAGradientLayer class];
}

- (CAGradientLayer *)gradientLayer
{
	NSParameterAssert([self.layer isKindOfClass:[CAGradientLayer class]]);
	return (CAGradientLayer *)self.layer;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	self.backgroundColor = [UIColor clearColor];

	if (self.textLabel) {
		self.textLabel.backgroundColor = [UIColor clearColor];
	}
	
	if (self.detailTextLabel) {
		self.detailTextLabel.backgroundColor = [UIColor clearColor];
	}
}

@end
