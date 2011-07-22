//
//  CFUtils.m
//
//  Created by Kaz Yoshikawa on 10/11/18.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import "CFUtils.h"
#import "ZCFObject.h"

#ifdef __cplusplus
extern "C" {
#endif

CFTypeRef CFAutorelease_(CFTypeRef aObject)
{
	if (aObject) {
		ZCFObject __unused *object = [[[ZCFObject alloc] initWithCFObject:aObject] autorelease];
	}
	return aObject;
}

#ifdef __cplusplus
}
#endif
