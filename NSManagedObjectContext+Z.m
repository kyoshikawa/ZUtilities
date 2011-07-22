//
//  NSManagedObjectContext+Z.m
//
//  Created by Kaz Yoshikawa on 11/05/20.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import "NSManagedObjectContext+Z.h"


@implementation NSManagedObjectContext (Z)

- (NSManagedObject *)objectWithURIString:(NSString *)aURIString
{
	if (aURIString) {
		NSURL *objectURI = [NSURL URLWithString:aURIString];
		NSManagedObjectID *objectID = [[self persistentStoreCoordinator] managedObjectIDForURIRepresentation:objectURI];
		if (objectID) {
			return [self objectWithID:objectID];
		}
	}
	return nil;
}

@end
