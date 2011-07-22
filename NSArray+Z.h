//
//  NSArray+Z.h
//
//  Created by Kaz Yoshikawa on 11/02/04.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (Z)

- (NSArray *)arrayByRemovingObject:(id)anObject;
- (NSArray *)arrayByRemovingObjectsFromArray:(NSArray *)aObjects;
- (NSArray *)arrayByRemovingObjectsFromSet:(NSSet *)aObjects;
- (NSArray *)arrayByAddingObjectsFromSet:(NSSet *)aObjects;
- (NSArray *)arrayByInsertingObjects:(NSArray *)aObjects atIndex:(NSUInteger)aIndex;

@end


@interface NSMutableArray (Z)

- (void)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;
- (void)removeObjectsInSet:(NSSet *)aSet;
- (void)insertObjects:(NSArray *)aObjects atIndex:(NSUInteger)aIndex;

@end
