//
//  NSMutableSet+Z.h
//
//  Created by Kaz Yoshikawa on 10/11/30.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableSet (Z)

- (void)addObjectIfNotNil:(id)aObject;
- (void)removeObjectIfNotNil:(id)aObject;

@end
