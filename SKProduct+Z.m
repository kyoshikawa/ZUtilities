//
//  SKProduct+Z.m
//
//  Created by Kaz Yoshikawa on 11/03/09.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import "SKProduct+Z.h"


@implementation SKProduct (Z)

- (NSString *)priceAsString
{
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	[formatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
	[formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
	[formatter setLocale:[self priceLocale]];

	NSString *string = [formatter stringFromNumber:[self price]];
	[formatter release];
	return string;
}

@end
