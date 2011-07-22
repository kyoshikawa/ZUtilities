//
//  NSData+Z.m
//
//  Created by Kaz Yoshikawa on 3/14/10.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "NSData+Z.h"
#import "NSString+Z.h"

//
//	NSData
//
@implementation NSData (Z)

+ (NSData *)dataNamed:(NSString *)aName
{
	NSData *data = nil;
	NSString *resourceFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:aName];
	if ([[NSFileManager defaultManager] fileExistsAtPath:resourceFilePath]) {
		data = [NSData dataWithContentsOfFile:resourceFilePath];
	}
	return data;
}

- (BOOL)writeToFile:(NSString *)path createIntermediateDirectories:(BOOL)aCreateIntermediates error:(NSError **)errorPtr
{
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *directoryPath = [path stringByDeletingLastPathComponent];
	
	if (![fileManager fileExistsAtPath:directoryPath] && aCreateIntermediates) {
		if (![fileManager createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:errorPtr]) {
			return NO;
		}
	}
	
	BOOL result = [self writeToFile:path options:0 error:errorPtr];
	return result;
}

- (NSString *)hexadecimalString
{
	static char hexchars[16] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
	unsigned char *bytes = (unsigned char *)[self bytes];
	NSUInteger length = [self length];
	unsigned char *bytePtr = bytes;
	unsigned char byte;
	NSMutableString *string = [NSMutableString string];
	for (NSUInteger index = 0 ; index < length ; index++) {
		byte = *(bytePtr++);
		NSUInteger lo = (byte & 0x0f) >> 0;
		NSUInteger hi = (byte & 0xf0) >> 4;
		[string appendFormat:@"%c%c", hexchars[hi], hexchars[lo]];
	}
	return [NSString stringWithString:string];
}

#pragma mark -

- (NSData *)sha1Digest
{
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1([self bytes], [self length], result);
    return [NSData dataWithBytes:result length:CC_SHA1_DIGEST_LENGTH];
}

- (NSData *)md5Digest
{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5([self bytes], [self length], result);
    return [NSData dataWithBytes:result length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)sha1DigestString
{
	return [[self sha1Digest] hexadecimalString];
}

- (NSString *)md5DigestString
{
	return [[self md5Digest] hexadecimalString];
}

- (NSDictionary *)propertyList
{
	NSError *error = nil;
	NSDictionary *dictionary = [NSPropertyListSerialization propertyListWithData:self options:NSPropertyListImmutable format:NULL error:&error];
	if (error) NSLog(@"error: %@", error);
	return dictionary;
}

- (id)unarchive
{
	return [NSKeyedUnarchiver unarchiveObjectWithData:self];
}

@end
