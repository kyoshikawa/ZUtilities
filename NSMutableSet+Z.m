//
//  NSMutableSet+Z.m
//
//  Created by Kaz Yoshikawa on 10/11/30.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import "NSMutableSet+Z.h"


@implementation NSMutableSet (Z)

- (void)addObjectIfNotNil:(id)aObject
{
	if (aObject) {
		[self addObject:aObject];
	}
}

- (void)removeObjectIfNotNil:(id)aObject
{
	if (aObject) {
		[self removeObject:aObject];
	}
}

@end
