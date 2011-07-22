//
//  NSUserDefaults+Z.m
//
//  Created by Kaz Yoshikawa on 11/01/04.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import "NSUserDefaults+Z.h"


//
//	NSUserDefaults (Z)
//
@implementation NSUserDefaults (Z)

- (id)valueForKey:(NSString *)key
{
	return [self objectForKey:key];
}

- (void)setValue:(id)value forKey:(NSString *)key
{
	if (value == nil || value == [NSNull null]) {
		[self removeObjectForKey:key];
	}
	else if ([value isKindOfClass:[NSDictionary class]] ||
		[value isKindOfClass:[NSArray class]] ||
		[value isKindOfClass:[NSString class]] ||
		[value isKindOfClass:[NSData class]] ||
		[value isKindOfClass:[NSDate class]] ||
		[value isKindOfClass:[NSNumber class]] ||
		[value isKindOfClass:[NSURL class]]) {
		[self setObject:value forKey:key];
	}
	else {
		NSAssert(NO, @"Unexpected class object");
	}
}


@end
