//
//  CGPDFUtils.h
//
//  Created by Kaz Yoshikawa on 10/11/18.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

#ifdef __cplusplus
extern "C" {
#endif

NSString *NSStringFromCGPDFObjectType_(CGPDFObjectRef object);
NSString *NStringFromCGPDFDataFormat_(CGPDFDataFormat aFormat);

#ifdef __cplusplus
}
#endif
