//
//  NSCharacterSet+Z.m
//
//  Created by Kaz Yoshikawa on 10/12/03.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import "NSCharacterSet+Z.h"


@implementation NSCharacterSet (Z)

+ (NSCharacterSet *)hexadecimalDigitCharacterSet
{
	return [NSCharacterSet characterSetWithCharactersInString:@"0123456789abcdefABCDEF"];
}

- (NSCharacterSet *)characterSetByRemovingCharactersInString:(NSString *)aString
{
	NSMutableCharacterSet *charSet = [[self mutableCopy] autorelease];
	[charSet removeCharactersInString:aString];
	return charSet;
}

- (NSCharacterSet *)characterSetByAddingCharactersInString:(NSString *)aString
{
	NSMutableCharacterSet *charSet = [[self mutableCopy] autorelease];
	[charSet addCharactersInString:aString];
	return charSet;
}

@end
