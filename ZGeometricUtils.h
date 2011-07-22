//
//  ZGeometricUtils.h
//
//  Created by Kaz Yoshikawa on 10/10/19.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

#ifdef __cplusplus
extern "C" {
#endif

#if TARGET_OS_MAC
extern NSString *NSStringFromCGPoint();
#endif

extern CGFloat DegreesToRadians(CGFloat degrees);
extern CGFloat RadiansToDegrees(CGFloat radians);
extern CGRect CGRectMakeAspectToFill_(CGSize imageSize, CGRect bounds);
extern CGRect CGRectMakeAspectFit_(CGSize imageSize, CGRect bounds);
extern CGSize CGSizeMakeAspectFit_(CGSize imageSize, CGSize frameSize);
extern CGSize CGSizeIntegral_(CGSize aSize);
extern NSString *CGPointString(CGPoint aPoint);
extern CGPoint CGRectGetMidXMidYPoint_(CGRect aRect);
extern CGPoint CGRectGetMinXMinYPoint_(CGRect aRect);
extern CGPoint CGRectGetMaxXMaxYPoint_(CGRect aRect);
extern CGPoint CGRectGetMinXMaxYPoint_(CGRect aRect);
extern CGPoint CGRectGetMaxXMinYPoint_(CGRect aRect);
extern CGPoint CGRectGetMinXMidYPoint_(CGRect aRect);
extern CGPoint CGRectGetMaxXMidYPoint_(CGRect aRect);
extern CGPoint CGRectGetMidXMinYPoint_(CGRect aRect);
extern CGPoint CGRectGetMidXMaxYPoint_(CGRect aRect);

extern CGPoint CGPointOffset_(CGPoint aPoint, CGPoint aOffset);
extern CGRect CGRectMakeWithPoints_(CGPoint aPoint1, CGPoint aPoint2);
extern CGPathRef CGPathCreateRoundRect_(CGRect aRect, CGFloat aRadius);


CG_INLINE CGFloat CGAffineTransformGetHorizontalScaleFactor_(CGAffineTransform t)
{
	return sqrtf(t.a * t.a + t.c * t.c);
}

CG_INLINE CGFloat CGAffineTransformGetVerticalScaleFactor_(CGAffineTransform t)
{
	return sqrtf(t.b * t.b + t.d * t.d);
}

#ifdef __cplusplus
}
#endif



@interface ZPoint : NSObject <NSCoding>
{
	CGPoint point;
}
@property (assign) CGPoint CGPointValue;

+ (id)pointWithCGPoint:(CGPoint)aPoint;
- (id)initWithCGPoint:(CGPoint)aPoint;
- (id)initWithCoder:(NSCoder *)decoder;
- (void)encodeWithCoder:(NSCoder *)encoder;

@end


@interface ZRect : NSObject <NSCoding>
{
	CGRect rect;
}
@property (assign) CGRect CGRectValue;

+ (id)rectWithCGRect:(CGRect)aRect;
- (id)initWithCGRect:(CGRect)aRect;
- (id)initWithCoder:(NSCoder *)decoder;
- (void)encodeWithCoder:(NSCoder *)encoder;

@end


@interface ZRange : NSObject <NSCoding>
{
	NSRange range;
}
@property (assign) NSRange NSRangeValue;
@property (assign) NSUInteger location;
@property (assign) NSUInteger length;


+ (id)rangeWithNSRange:(NSRange)aRange;
- (id)initWithNSRange:(NSRange)aRange;
- (id)initWithCoder:(NSCoder *)decoder;
- (void)encodeWithCoder:(NSCoder *)encoder;


@end
