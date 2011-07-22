//
//  NSMutableData+Z.m
//
//  Created by Kaz Yoshikawa on 11/02/12.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import "NSMutableData+Z.h"


//
//	NSMutableData
//
@implementation NSMutableData (Z)

- (void)appendInt32:(int32_t)aInt32
{
	int32_t value = CFSwapInt32HostToBig(aInt32);
	[self appendBytes:&value length:sizeof(value)];
}

- (void)appendUInt32:(uint32_t)aInt32
{
	uint32_t value = CFSwapInt32HostToBig(aInt32);
	[self appendBytes:&value length:sizeof(value)];
}

@end
