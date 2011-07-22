//
//  ZCFObject.m
//
//  Created by Kaz Yoshikawa on 11/03/06.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import "ZCFObject.h"


//
//	ZCFObject
//
@implementation ZCFObject

+ (id)CFObject:(CFTypeRef)aObjectRef
{
	return [[[ZCFObject alloc] initWithCFObject:aObjectRef] autorelease];
}

- (id)initWithCFObject:(CFTypeRef)aObjectRef
{
	NSParameterAssert(aObjectRef);
	if ((self = [super init])) {
		objectRef = CFRetain(aObjectRef);
	}
	return self;
}

- (void)dealloc
{
	CFRelease(objectRef), objectRef = NULL;
	[super dealloc];
}

@end
