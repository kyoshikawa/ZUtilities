//
//  NSDictionary+Z.m
//
//  Created by Kaz Yoshikawa on 11/03/09.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import "NSDictionary+Z.h"


//
//	NSDictionary
//
@implementation NSDictionary (Z)

- (NSString *)localizedString
{
	NSString *string = nil;
	for (NSString *language in [NSLocale preferredLanguages]) {
		string = [self valueForKey:language];
		if (string) return string;
	}
	return [[self allValues] lastObject];
}

@end
