//
//  ZCFObject.h
//
//  Created by Kaz Yoshikawa on 11/03/06.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


//
//	ZCFObject
//
@interface ZCFObject : NSObject
{
	CFTypeRef objectRef;
}

+ (id)CFObject:(CFTypeRef)aObjectRef;
- (id)initWithCFObject:(CFTypeRef)aObjectRef;

@end
