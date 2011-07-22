//
//  NSSet+Z.h
//
//  Created by Kaz Yoshikawa on 10/08/01.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSSet (Z)

- (NSSet *)setByRemovingObjectsFromSet:(NSSet *)aSet;
- (NSSet *)setByRemovingObjectsFromArray:(NSArray *)aArray;
- (NSSet *)setByRemovingObject:(id)aObject;
- (NSSet *)setByIntersectSet:(NSSet *)aSet;

@end


@interface NSMutableSet (Z)

- (void)addObjectsFromSet:(NSSet *)objects;
- (void)removeObjectsFromSet:(NSSet *)objects;
- (void)removeObjectsFromArray:(NSArray *)objects;

@end

