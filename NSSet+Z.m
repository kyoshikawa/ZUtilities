//
//  NSSet+Z.m
//
//  Created by Kaz Yoshikawa on 10/08/01.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import "NSSet+Z.h"


@implementation NSSet (ewoods)

- (NSSet *)setByRemovingObjectsFromSet:(NSSet *)aSet
{
	NSMutableSet *anotherSet = [NSMutableSet setWithSet:self];
	[anotherSet minusSet:aSet];
	return anotherSet;
}

- (NSSet *)setByRemovingObjectsFromArray:(NSArray *)aArray
{
	NSMutableSet *anotherSet = [NSMutableSet setWithSet:self];
	[anotherSet removeObjectsFromArray:aArray];
	return anotherSet;
}

- (NSSet *)setByRemovingObject:(id)aObject
{
	NSMutableSet *anotherSet = [NSMutableSet setWithSet:self];
	[anotherSet removeObject:aObject];
	return anotherSet;
}

- (NSSet *)setByIntersectSet:(NSSet *)aSet
{
	NSMutableSet *anotherSet = [NSMutableSet setWithSet:self];
	[anotherSet intersectSet:aSet];
	return anotherSet;
}

@end


@implementation NSMutableSet (ewoods)

- (void)addObjectsFromSet:(NSSet *)objects
{
	[self unionSet:objects];
}

- (void)removeObjectsFromSet:(NSSet *)objects
{
	[self minusSet:objects];
}

- (void)removeObjectsFromArray:(NSArray *)objects
{
	[self minusSet:[NSSet setWithArray:objects]];
}

@end
