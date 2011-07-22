//
//  ZLabel.m
//
//  Created by Kaz Yoshikawa on 3/5/10.
//  Copyright Electricwoods LLC. All rights reserved.
//

#import "ZLabel.h"

//
//	external functions:
//
extern void CGColorToHSV(CGColorRef colorRef, CGFloat *h, CGFloat *s, CGFloat *v, CGFloat *a);


//
//	ZLabel
//
@implementation ZLabel


- (void)updateShadowColor
{
	self.shadowColor = [UIColor blackColor];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder])) {
		shadowBlur_ = 3.0f;
	}
	return self;
}

- (id)initWithFrame:(CGRect)aFrame
{
    if ((self = [super initWithFrame:aFrame])) {
		shadowBlur_ = 3.0f;
    }
    return self;
}

- (void)dealloc
{
	[tintColor_ release];
    [super dealloc];
}

- (void)layoutSubviews
{
	[super layoutSubviews];

	self.backgroundColor = [UIColor clearColor];
}

- (void)drawRect:(CGRect)rect
{
	CGContextRef contextRef = UIGraphicsGetCurrentContext();
	CGContextSaveGState(contextRef);

	CGContextSetShadowWithColor(contextRef, self.shadowOffset, shadowBlur_, self.shadowColor.CGColor);
	[super drawRect:rect];

	CGContextRestoreGState(contextRef);
}

- (CGFloat)shadowBlur
{
	return shadowBlur_;
}

- (void)setShadowBlur:(CGFloat)aBlur
{
	shadowBlur_ = aBlur;
	[self setNeedsDisplay];
}

- (UIColor *)tintColor
{
	return tintColor_;
}

- (void)setTintColor:(UIColor *)aColor
{
	[tintColor_ autorelease];
	CGFloat h = 0.0f, s = 0.0f, v = 0.0f, a = 0.0f;	
	if (aColor) {
		CGColorToHSV(aColor.CGColor, &h, &s, &v, &a);
	}
	tintColor_ = [aColor retain];
	
	BOOL textWhite = ((1.0 - v) + s > 0.5f && a > 0.1f);
	
	self.textColor = textWhite ? [UIColor whiteColor] : [UIColor blackColor];
	self.shadowColor = textWhite ? [UIColor colorWithWhite:0.0f alpha:0.5f] : [UIColor colorWithWhite:1.0f alpha:0.5f];
	self.shadowBlur = 4.0f;
}


@end
