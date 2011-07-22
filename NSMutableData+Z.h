//
//  NSMutableData+Z.h
//
//  Created by Kaz Yoshikawa on 11/02/12.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdint.h>

//
//	NSMutableData
//
@interface NSMutableData (Z)

- (void)appendInt32:(int32_t)aInt32;
- (void)appendUInt32:(uint32_t)aInt32;

@end
