//
//  NSDate+Z.m
//
//  Created by Kaz Yoshikawa on 11/03/08.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import "NSDate+Z.h"


@implementation NSDate (Z)

- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)aDateStyle timeStyle:(NSDateFormatterStyle)aTimeStyle
{
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	dateFormatter.dateStyle = aDateStyle;
	dateFormatter.timeStyle = aTimeStyle;
	return [dateFormatter stringFromDate:self];
}

- (NSString *)yearMonthString
{
	NSDateFormatter *yearMonthFormatter = [[NSDateFormatter alloc] init];
	[yearMonthFormatter setDateFormat:@"yyyy-MM"];
	NSString *string = [yearMonthFormatter stringFromDate:self];
	[yearMonthFormatter release];
	return string;
}
@end
