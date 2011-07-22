//
//  NSFileHandle+Z.m
//
//  Created by Kaz Yoshikawa on 11/02/12.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import "NSFileHandle+Z.h"


@implementation NSFileHandle (Z)


- (int32_t)readInt32
{
	int32_t value;
	[[self readDataOfLength:sizeof(value)] getBytes:&value length:sizeof(value)];
	value = (int32_t)CFSwapInt32BigToHost(value);
	return value;
}

- (uint32_t)readUInt32
{
	uint32_t value;
	[[self readDataOfLength:sizeof(value)] getBytes:&value length:sizeof(value)];
	value = CFSwapInt32BigToHost(value);
	return value;
}

- (void)writeInt32:(int32_t)aValue
{
	int32_t value = CFSwapInt32HostToBig(aValue);
	[self writeData:[NSData dataWithBytes:&value length:sizeof(value)]];
}

- (void)writeUInt32:(uint32_t)aValue
{
	int32_t value = CFSwapInt32HostToBig(aValue);
	[self writeData:[NSData dataWithBytes:&value length:sizeof(value)]];
}

@end
