//
//  NSString+Z.h
//
//  Created by Kaz Yoshikawa on 10/12/07.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (Z)

+ (NSString *)UUID;
+ (NSString *)stringWithDataSize:(uint64_t)aDataSize;

- (NSString *)hexadecimalString;
- (NSComparisonResult)likeFinderCompare:(NSString*)string;
- (BOOL)beginsWithString:(NSString *)aString;
- (NSString *)stringByDeletingPrefix:(NSString *)aPrefix;
- (NSString *)stringByDeletingSuffix:(NSString *)aSuffix;

@end
