//
//  ZGrossyButton.m
//
//  Created by Kaz Yoshikawa on 11/02/06.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ZGlossyButton.h"
#import "ZGeometricUtils.h"
#import "NSSet+Z.h"

@implementation ZGlossyButton

- (void)setupGlossyButton
{
	self.tintColor = [UIColor colorWithHue:0.3 saturation:0.0 brightness:1.0 alpha:1.0];
	self.layer.cornerRadius = 6;
	self.clipsToBounds = YES;
//	activeTouches = [[NSMutableSet alloc] init];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder])) {
		[self setupGlossyButton];
	}
	return self;
}

- (id)initWithFrame:(CGRect)aFrame
{
	if ((self = [super initWithFrame:aFrame])) {
		[self setupGlossyButton];
	}
	return self;
}

- (void)drawRect:(CGRect)rect
{
	CGContextRef contextRef = UIGraphicsGetCurrentContext();
	CGPoint point1 = CGRectGetMidXMinYPoint_(self.bounds);
	CGPoint point2 = CGRectGetMidXMaxYPoint_(self.bounds);
	CGPoint startPt = self.highlighted ? point2 : point1;
	CGPoint endPt = self.highlighted ? point1 : point2;
	CGContextDrawLinearGradient(contextRef, gradientRef, startPt, endPt, 0);

	[super drawRect:rect];
}

- (void)dealloc
{
	CGGradientRelease(gradientRef);
//	[activeTouches release];
	[tintColor release];
    [super dealloc];
}

#pragma mark -

- (UIColor *)tintColor
{
	return tintColor;
}

- (void)setTintColor:(UIColor *)aTintColor
{
	ZHSVA hsva1, hsva2;

	[tintColor autorelease];
	tintColor = [aTintColor retain];

	hsva1 = ZHSVAFromCGColor(tintColor.CGColor);
	hsva1.v = fmaxf(hsva1.v, 0.2f);
	hsva2 = hsva1;
	hsva2.v -= 0.2f;

	ZRGBA rgba0_4 = ZRGBAFromZHSVA(hsva1);
	ZRGBA rgba4_4 = ZRGBAFromZHSVA(hsva2);
	
	ZRGBA rgba2_4 = { (rgba0_4.r+rgba4_4.r)/2.0f, (rgba0_4.g+rgba4_4.g)/2.0f, (rgba0_4.b+rgba4_4.b)/2.0f, (rgba0_4.a+rgba4_4.a)/2.0f };
	ZRGBA rgba1_4 = { (rgba0_4.r+rgba2_4.r)/2.0f, (rgba0_4.g+rgba2_4.g)/2.0f, (rgba0_4.b+rgba2_4.b)/2.0f, (rgba0_4.a+rgba2_4.a)/2.0f };
	ZRGBA rgba3_4 = { (rgba4_4.r+rgba2_4.r)/2.0f, (rgba4_4.g+rgba2_4.g)/2.0f, (rgba4_4.b+rgba2_4.b)/2.0f, (rgba4_4.a+rgba2_4.a)/2.0f };
	
	NSArray *colors = [NSArray arrayWithObjects:
			(id)CGColorFromZRGBA(rgba0_4),
			(id)CGColorFromZRGBA(rgba1_4),
			(id)CGColorFromZRGBA(rgba3_4),
			(id)CGColorFromZRGBA(rgba4_4),
			nil];
	CGFloat locations[4] = { 0.0, 0.48, 0.52, 1.0 };

	CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
	
	CGGradientRelease(gradientRef);
	gradientRef = CGGradientCreateWithColors(colorSpaceRef, (CFArrayRef)colors, locations);

	CGColorSpaceRelease(colorSpaceRef);
	
	[self setNeedsLayout];
}

- (void)setHighlighted:(BOOL)aHighlighted
{
	if (self.highlighted != aHighlighted) {
		[self setNeedsDisplay];
	}
	[super setHighlighted:aHighlighted];
}

@end
