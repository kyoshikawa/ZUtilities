//
//  ZGradient.h
//
//  Created by Kaz Yoshikawa on 11/03/06.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

//
//	ZGradient
//
@interface ZGradient : NSObject
{
	NSArray *colors;
	NSArray *positions;
	CGGradientRef gradientRef;
}
@property (copy) NSArray *colors;
@property (copy) NSArray *positions;
@property (readonly) CGGradientRef CGGradient;

+ (id)gradientWithColors:(NSArray *)aColors positions:(NSArray *)aPositions;
+ (id)gradientWithColorsAndPositions:(id)aFirstObject, ...;

- (id)initWithColors:(NSArray *)aColors positions:(NSArray *)aPositions;
- (id)initWithColorsAndPositions:(id)aFirstObject, ...;
- (id)initWithColorsAndPositions:(id)aFirstObject va_list:(va_list)aArgs;
- (CGGradientRef)CGGradient;


@end
