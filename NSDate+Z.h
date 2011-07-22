//
//  NSDate+Z.h
//
//  Created by Kaz Yoshikawa on 11/03/08.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (Z)

- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)aDateStyle timeStyle:(NSDateFormatterStyle)aTimeStyle;
- (NSString *)yearMonthString;

@end
