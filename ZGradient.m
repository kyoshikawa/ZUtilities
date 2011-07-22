//
//  ZGradient.m
//
//  Created by Kaz Yoshikawa on 11/03/06.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import "ZGradient.h"
#import "ZColorUtils.h"
#import "ZCFObject.h"


//
//	ZGradient
//
@implementation ZGradient

@synthesize colors;
@synthesize positions;
@synthesize CGGradient = gradientRef;

+ (id)gradientWithColors:(NSArray *)aColors positions:(NSArray *)aPositions
{
	return [[[ZGradient alloc] initWithColors:aColors positions:aPositions] autorelease];
}

+ (id)gradientWithColorsAndPositions:(id)aFirstObject, ...;
{
	va_list args;
	va_start(args, aFirstObject);
	va_end(args);

	return [[[ZGradient alloc] initWithColorsAndPositions:aFirstObject va_list:args] autorelease];
}

- (id)initWithColors:(NSArray *)aColors positions:(NSArray *)aPositions
{
	NSParameterAssert([aColors count] > 1 && [aColors count] == [aPositions count]);
	NSParameterAssert([[aPositions objectAtIndex:0] floatValue] == 0.0f);
	NSParameterAssert([[aPositions lastObject] floatValue] == 1.0f);

	if ((self = [super init])) {
		self.colors = aColors;
		self.positions = aPositions;

		int count = [colors count];
		CGFloat *locations = malloc(sizeof(CGFloat) * count);
		CGFloat *components = malloc(sizeof(CGFloat) * count * 4);
		CGFloat *locationPtr = locations;
		CGFloat *componentPtr = components;

		for (NSInteger index = 0 ; index < count ; index++) {
			ZRGBA rgba;
			id colorObject = [colors objectAtIndex:index];
			if ([colorObject isKindOfClass:[UIColor class]]) {
				UIColor *color = (UIColor *)colorObject;
				rgba = ZRGBAFromCGColor(color.CGColor);
			}
			else NSAssert(NO, @"Unexpected Color Object");
			*(locationPtr++) = [[positions objectAtIndex:index] floatValue];
			*(componentPtr++) = rgba.r;
			*(componentPtr++) = rgba.g;
			*(componentPtr++) = rgba.b;
			*(componentPtr++) = rgba.a;
		}

		CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
		gradientRef = CGGradientCreateWithColorComponents(colorSpace, components, locations, count);
		CGColorSpaceRelease(colorSpace);
		NSParameterAssert(gradientRef);
		
		free(locations);
		free(components);
	}
	return self;
}

- (id)initWithColorsAndPositions:(id)aFirstObject va_list:(va_list)aArgs
{
	NSMutableArray *colorObjects = [NSMutableArray array];
	NSMutableArray *positionObjects = [NSMutableArray array];

	id colorObject = aFirstObject;
	id positionObject = nil;
	while (colorObject) {
		NSParameterAssert([colorObject isKindOfClass:[UIColor class]] ||
						  [colorObject isKindOfClass:[NSValue class]]);
		positionObject = va_arg(aArgs, id);
		NSParameterAssert([positionObject isKindOfClass:[NSNumber class]]);

		[colorObjects addObject:colorObject];
		[positionObjects addObject:positionObject];
		
		colorObject = va_arg(aArgs, id);
	}
	
	if ((self = [self initWithColors:colorObjects positions:positionObjects])) {
	}
	
	return self;
}

- (id)initWithColorsAndPositions:(id)aFirstObject, ...
{
	va_list args;
	va_start(args, aFirstObject);
	va_end(args);

	if ((self = [self initWithColorsAndPositions:aFirstObject va_list:args])) {
	}
	return self;
}

- (void)dealloc
{
	[colors release], colors = nil;
	[positions release], positions = nil;
	CGGradientRelease(gradientRef), gradientRef = nil;
	[super dealloc];
}

//- (CGGradientRef)CGGradient
//{
//	int count = [colors count];
//	CGFloat *locations = malloc(sizeof(CGFloat) * count);
//	CGFloat *components = malloc(sizeof(CGFloat) * count * 4);
//	CGFloat *locationPtr = locations;
//	CGFloat *componentPtr = components;
//
//	for (NSInteger index = 0 ; index < count ; index++) {
//		ZRGBA rgba;
//		id colorObject = [colors objectAtIndex:index];
//		if ([colorObject isKindOfClass:[UIColor class]]) {
//			UIColor *color = (UIColor *)colorObject;
//			rgba = ZRGBAFromCGColor(color.CGColor);
//		}
//		else if ([colorObject isKindOfClass:[NSValue class]]) {
//			rgba = ZRGBAFromValue((NSValue *)colorObject);
//		}
//		else NSAssert(NO, @"Unexpected Color Object");
//		*(locationPtr++) = [[positions objectAtIndex:index] floatValue];
//		*(componentPtr++) = rgba.r;
//		*(componentPtr++) = rgba.g;
//		*(componentPtr++) = rgba.b;
//		*(componentPtr++) = rgba.a;
//	}
//
//	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//	CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, count);
//	CGColorSpaceRelease(colorSpace);
//
//	ZCFObject *object = [ZCFObject CFObject:gradient];
//	NSParameterAssert(object);
//	return gradient;
//}

@end
