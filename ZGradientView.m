//
//  ZGradientView.m
//
//  Created by Kaz Yoshikawa on 11/02/17.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import "ZGradientView.h"
#import "ZColorUtils.h"

@implementation ZGradientView

+ (Class)layerClass
{
	return [CAGradientLayer class];
}

- (id)initWithFrame:(CGRect)aFrame
{
    if ((self = [super initWithFrame:aFrame])) {
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc
{
    [super dealloc];
}


- (CAGradientLayer *)gradientLayer
{
	NSParameterAssert([self.layer isKindOfClass:[CAGradientLayer class]]);
	return (CAGradientLayer *)self.layer;
}

- (void)setTintColor:(UIColor *)aTintColor
{
	ZHSVA hsva1, hsva2;

//	[tintColor autorelease];
//	tintColor = [aTintColor retain];

	hsva1 = ZHSVAFromCGColor(aTintColor.CGColor);
	hsva1.v = fmaxf(hsva1.v, 0.2f);
	hsva2 = hsva1;
	hsva2.v -= 0.2f;

	ZRGBA rgba0_4 = ZRGBAFromZHSVA(hsva1);
	ZRGBA rgba4_4 = ZRGBAFromZHSVA(hsva2);
	
	ZRGBA rgba2_4 = { (rgba0_4.r+rgba4_4.r)/2.0f, (rgba0_4.g+rgba4_4.g)/2.0f, (rgba0_4.b+rgba4_4.b)/2.0f, (rgba0_4.a+rgba4_4.a)/2.0f };
	ZRGBA rgba1_4 = { (rgba0_4.r+rgba2_4.r)/2.0f, (rgba0_4.g+rgba2_4.g)/2.0f, (rgba0_4.b+rgba2_4.b)/2.0f, (rgba0_4.a+rgba2_4.a)/2.0f };
	ZRGBA rgba3_4 = { (rgba4_4.r+rgba2_4.r)/2.0f, (rgba4_4.g+rgba2_4.g)/2.0f, (rgba4_4.b+rgba2_4.b)/2.0f, (rgba4_4.a+rgba2_4.a)/2.0f };
	
	self.gradientLayer.colors = [NSArray arrayWithObjects:
			(id)CGColorFromZRGBA(rgba0_4),
			(id)CGColorFromZRGBA(rgba1_4),
			(id)CGColorFromZRGBA(rgba3_4),
			(id)CGColorFromZRGBA(rgba4_4),
			nil];
	self.gradientLayer.locations = [NSArray arrayWithObjects:
			[NSNumber numberWithFloat:0.0],
			[NSNumber numberWithFloat:0.35],
			[NSNumber numberWithFloat:0.65],
			[NSNumber numberWithFloat:1.0],
			nil];			

//	CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();

	
//	CGGradientRelease(gradientRef);
//	gradientRef = CGGradientCreateWithColors(colorSpaceRef, (CFArrayRef)colors, locations);
//	CGColorSpaceRelease(colorSpaceRef);
}


@end
