//
//  NSManagedObjectContext+Z.h
//
//  Created by Kaz Yoshikawa on 11/05/20.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (Z)

- (NSManagedObject *)objectWithURIString:(NSString *)aURIString;

@end
