//
//  CGPDFUtils.m
//
//  Created by Kaz Yoshikawa on 10/11/18.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import "CGPDFUtils.h"


NSString *NSStringFromCGPDFObjectType_(CGPDFObjectRef object)
{
	if (object == NULL)					return @"NULL";

	switch (CGPDFObjectGetType(object)) {
	case kCGPDFObjectTypeNull:			return @"kCGPDFObjectTypeNull";
	case kCGPDFObjectTypeBoolean:		return @"kCGPDFObjectTypeBoolean";
	case kCGPDFObjectTypeInteger:		return @"kCGPDFObjectTypeInteger";
	case kCGPDFObjectTypeReal:			return @"kCGPDFObjectTypeReal";
	case kCGPDFObjectTypeName:			return @"kCGPDFObjectTypeName";
	case kCGPDFObjectTypeString:		return @"kCGPDFObjectTypeString";
	case kCGPDFObjectTypeArray:			return @"kCGPDFObjectTypeArray";
	case kCGPDFObjectTypeDictionary:	return @"kCGPDFObjectTypeDictionary";
	case kCGPDFObjectTypeStream:  		return @"kCGPDFObjectTypeStream";
	default: 							return @"Unknown";
	}
}

NSString *NStringFromCGPDFDataFormat_(CGPDFDataFormat aFormat)
{
	switch (aFormat) {
    case CGPDFDataFormatRaw:			return @"CGPDFDataFormatRaw";
	case CGPDFDataFormatJPEGEncoded:	return @"CGPDFDataFormatJPEGEncoded";
	case CGPDFDataFormatJPEG2000:		return @"CGPDFDataFormatJPEG2000";
	default:							return @"Unknown";
	}
}
