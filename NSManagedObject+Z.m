//
//  NSManagedObject+Z.m
//
//  Created by Kaz Yoshikawa on 11/05/20.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//


#import "NSManagedObject+Z.h"


@implementation NSManagedObject (Z)

- (NSString *)URIString
{
	return [[[self objectID] URIRepresentation] absoluteString];
}

@end
