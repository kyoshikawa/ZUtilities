//
//  ZUtils.m
//
//  Created by Kaz Yoshikawa on 11/02/04.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import "ZUtils.h"


#ifdef __cplusplus
}
#endif

void ZReportError(NSError *error)
{
	if (error) {
		NSLog(@"%@", error);
	}
}

NSString *ZDocumentDirectory()
{
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

NSString *ZCachesDirectory()
{
	return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

NSURL *ZDocumentDirectoryURL()
{
	return [NSURL fileURLWithPath:ZDocumentDirectory()];
}

NSURL *ZCachesDirectoryURL()
{
	return [NSURL fileURLWithPath:ZCachesDirectory()];
}

BOOL ZFilePathEqualToFilePath(NSString *aPath1, NSString *aPath2)
{
	NSString *path1 = [aPath1 stringByExpandingTildeInPath];
	NSString *path2 = [aPath2 stringByExpandingTildeInPath];

	return [path1 isEqualToString:path2];
}

NSNumber *ZTrueValue()
{
	return (NSNumber *)kCFBooleanTrue;
}

NSNumber *ZFalseValue()
{
	return (NSNumber *)kCFBooleanFalse;
}

NSRange NSRangeFromCFRange(CFRange range)
{
	return NSMakeRange(range.location == kCFNotFound ? NSNotFound : range.location, range.length);
}

CFRange CFRangeFromNSRange(NSRange range)
{
	return CFRangeMake(range.location == NSNotFound ? kCFNotFound : range.location, range.length);
}


#ifdef __cplusplus
}
#endif
