//
//  NSCharacterSet+Z.h
//
//  Created by Kaz Yoshikawa on 10/12/03.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSCharacterSet (Z)

+ (NSCharacterSet *)hexadecimalDigitCharacterSet;

- (NSCharacterSet *)characterSetByRemovingCharactersInString:(NSString *)aString;
- (NSCharacterSet *)characterSetByAddingCharactersInString:(NSString *)aString;

@end
