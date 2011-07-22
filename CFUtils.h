//
//  CFUtils.h
//
//  Created by Kaz Yoshikawa on 10/11/18.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CFRelease_(obj) do { if (obj) CFRelease(obj); } while (0)


#ifdef __cplusplus
extern "C" {
#endif

extern CFTypeRef CFAutorelease_(CFTypeRef aObject);

#ifdef __cplusplus
}
#endif
