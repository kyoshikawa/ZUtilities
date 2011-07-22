//
//  ZGeometricUtils.m
//
//  Created by kyoshikawa on 10/10/19.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import "ZGeometricUtils.h"

#ifdef __cplusplus
extern "C" {
#endif

#if TARGET_OS_MAC
NSString *NSStringFromCGPoint(CGPoint aPoint)
{
	return [NSString stringWithFormat:@"{%f,%f}", aPoint.x, aPoint.y];
}
#endif


CGFloat DegreesToRadians(CGFloat degrees)
{
	return degrees * M_PI / 180;
};

CGFloat RadiansToDegrees(CGFloat radians)
{
	return radians * 180/M_PI;
};


CGRect CGRectMakeAspectToFill_(CGSize imageSize, CGRect bounds)
{
	CGRect result;
	float horizontalRatioToFit = bounds.size.width / imageSize.width;
	float verticalRatioToFit = bounds.size.height / imageSize.height;
	
	float imageHeightWhenItFitsHorizontally = horizontalRatioToFit * imageSize.height;
	float imageWidthWhenItFitsVertically = verticalRatioToFit * imageSize.width;

	float minX = CGRectGetMinX(bounds);
	float minY = CGRectGetMinY(bounds);

	if (imageHeightWhenItFitsHorizontally > bounds.size.height) {
		float margin = (imageHeightWhenItFitsHorizontally - bounds.size.height) * 0.5f;
		result = CGRectMake(minX, minY - margin, imageSize.width * horizontalRatioToFit, imageSize.height * horizontalRatioToFit);
	}
	else {
		float margin = (imageWidthWhenItFitsVertically - bounds.size.width) * 0.5f;
		result = CGRectMake(minX - margin, minY, imageSize.width * verticalRatioToFit, imageSize.height * verticalRatioToFit);
	}
	return result;
}

CGRect CGRectMakeAspectFit_(CGSize imageSize, CGRect bounds)
{
	float minX = CGRectGetMinX(bounds);
	float minY = CGRectGetMinY(bounds);
	float widthRatio = bounds.size.width / imageSize.width;
	float heightRatio = bounds.size.height / imageSize.height;
	float ratio = (widthRatio < heightRatio) ? widthRatio : heightRatio;
	float width = imageSize.width * ratio;
	float height = imageSize.height * ratio;
	float xmargin = (bounds.size.width - width) / 2.0f;
	float ymargin = (bounds.size.height - height) / 2.0f;
	return CGRectMake(minX + xmargin, minY + ymargin, width, height);
}

CGSize CGSizeMakeAspectFit_(CGSize imageSize, CGSize frameSize)
{
	float widthRatio = frameSize.width / imageSize.width;
	float heightRatio = frameSize.height / imageSize.height;
	float ratio = (widthRatio < heightRatio) ? widthRatio : heightRatio;
	float width = imageSize.width * ratio;
	float height = imageSize.height * ratio;
	return CGSizeMake(width, height);
}

CGSize CGSizeIntegral_(CGSize aSize)
{
	return CGSizeMake(roundf(aSize.width), roundf(aSize.height));
}

NSString *CGPointString(CGPoint aPoint)
{
	return NSStringFromCGPoint(aPoint);
}

#pragma mark -

CGPoint CGRectGetMidXMidYPoint_(CGRect aRect)
{
	return CGPointMake(CGRectGetMidX(aRect), CGRectGetMidY(aRect));
}

CGPoint CGRectGetMinXMinYPoint_(CGRect aRect)
{
	return CGPointMake(CGRectGetMinX(aRect), CGRectGetMinY(aRect));
}

CGPoint CGRectGetMaxXMaxYPoint_(CGRect aRect)
{
	return CGPointMake(CGRectGetMaxX(aRect), CGRectGetMaxY(aRect));
}

CGPoint CGRectGetMinXMaxYPoint_(CGRect aRect)
{
	return CGPointMake(CGRectGetMinX(aRect), CGRectGetMaxY(aRect));
}

CGPoint CGRectGetMaxXMinYPoint_(CGRect aRect)
{
	return CGPointMake(CGRectGetMaxX(aRect), CGRectGetMinY(aRect));
}

CGPoint CGRectGetMinXMidYPoint_(CGRect aRect)
{
	return CGPointMake(CGRectGetMinX(aRect), CGRectGetMidY(aRect));
}

CGPoint CGRectGetMaxXMidYPoint_(CGRect aRect)
{
	return CGPointMake(CGRectGetMaxX(aRect), CGRectGetMidY(aRect));
}

CGPoint CGRectGetMidXMinYPoint_(CGRect aRect)
{
	return CGPointMake(CGRectGetMidX(aRect), CGRectGetMinY(aRect));
}

CGPoint CGRectGetMidXMaxYPoint_(CGRect aRect)
{
	return CGPointMake(CGRectGetMidX(aRect), CGRectGetMaxY(aRect));
}

#pragma mark -

CGPoint CGPointOffset_(CGPoint aPoint, CGPoint aOffset)
{
	return CGPointMake(aPoint.x + aOffset.x, aPoint.y + aOffset.y);
}

CGRect CGRectMakeWithPoints_(CGPoint aPoint1, CGPoint aPoint2)
{
	CGFloat minX = fminf(aPoint1.x, aPoint2.x);
	CGFloat minY = fminf(aPoint1.y, aPoint2.y);
	CGFloat maxX = fmaxf(aPoint1.x, aPoint2.x);
	CGFloat maxY = fmaxf(aPoint1.y, aPoint2.y);
	return CGRectMake(minX, minY, maxX - minX, maxY - minY);
}

#pragma mark -

CGPathRef CGPathCreateRoundRect_(CGRect aRect, CGFloat aRadius)
{
	assert(CGRectGetWidth(aRect) >= aRadius * 2.0f);
	assert(CGRectGetHeight(aRect) >= aRadius * 2.0f);

	CGFloat t = CGRectGetMinY(aRect);
	CGFloat b = CGRectGetMaxY(aRect);
	CGFloat l = CGRectGetMinX(aRect);
	CGFloat r = CGRectGetMaxX(aRect);

	CGMutablePathRef pathRef = CGPathCreateMutable();
	CGPathMoveToPoint(pathRef, NULL, l+aRadius, t);
	CGPathAddArcToPoint(pathRef, NULL, l, t, l, t+aRadius, aRadius);
	CGPathAddArcToPoint(pathRef, NULL, l, b, l+aRadius, b, aRadius);
	CGPathAddArcToPoint(pathRef, NULL, r, b, r, b-aRadius, aRadius);
	CGPathAddArcToPoint(pathRef, NULL, r, t, r-aRadius, t, aRadius);
	CGPathCloseSubpath(pathRef);

	return pathRef;
}


#ifdef __cplusplus
}
#endif

//
//	ZPoint
//

@implementation ZPoint

@synthesize CGPointValue = point;

+ (id)pointWithCGPoint:(CGPoint)aPoint
{
	return [[[ZPoint alloc] initWithCGPoint:aPoint] autorelease];
}

- (id)initWithCGPoint:(CGPoint)aPoint
{
	if ((self = [super init])) {
		point = aPoint;
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
	if ((self = [super init])) {
		point.x = [decoder decodeFloatForKey:@"x"];
		point.y = [decoder decodeFloatForKey:@"y"];
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
	[encoder encodeFloat:point.x forKey:@"x"];
	[encoder encodeFloat:point.y forKey:@"y"];
}

@end


//
//	ZRect
//

@implementation ZRect

@synthesize CGRectValue = rect;

+ (id)rectWithCGRect:(CGRect)aRect
{
	return [[[ZRect alloc] initWithCGRect:aRect] autorelease];
}

- (id)initWithCGRect:(CGRect)aRect
{
	if ((self = [super init])) {
		rect = aRect;
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
	if ((self = [super init])) {
		rect.origin.x = [decoder decodeFloatForKey:@"x"];
		rect.origin.y = [decoder decodeFloatForKey:@"y"];
		rect.size.width = [decoder decodeFloatForKey:@"w"];
		rect.size.height = [decoder decodeFloatForKey:@"h"];
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
	[encoder encodeFloat:rect.origin.x forKey:@"x"];
	[encoder encodeFloat:rect.origin.y forKey:@"y"];
	[encoder encodeFloat:rect.size.width forKey:@"w"];
	[encoder encodeFloat:rect.size.height forKey:@"h"];
}

- (CGSize)size
{
	return rect.size;
}

- (void)setSize:(CGSize)aSize
{
	rect.size = aSize;
}

@end


//
//	ZRange
//

@implementation ZRange

@synthesize NSRangeValue = range;


+ (id)rangeWithNSRange:(NSRange)aRange
{
	return [[[ZRange alloc] initWithNSRange:aRange] autorelease];
}

- (id)initWithNSRange:(NSRange)aRange
{
	if ((self = [super init])) {
		range = aRange;
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
	if ((self = [super init])) {
		range.location = (NSUInteger)[decoder decodeIntegerForKey:@"location"];
		range.length = (NSUInteger)[decoder decodeIntegerForKey:@"length"];
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
	[encoder encodeInteger:range.location forKey:@"location"];
	[encoder encodeInteger:range.length forKey:@"length"];
}

- (NSUInteger)location
{
	return range.location;
}

- (void)setLocation:(NSUInteger)aLocation
{
	range.location = aLocation;
}

- (NSUInteger)length
{
	return range.length;
}

- (void)setLength:(NSUInteger)aLength
{
	range.length = aLength;
}

@end
