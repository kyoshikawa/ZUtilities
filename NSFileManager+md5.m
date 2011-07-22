//
//  NSFileManager+md5.m
//
//  Created by Kaz Yoshikawa on 11/04/10.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#include <CommonCrypto/CommonDigest.h>
#import "NSFileManager+md5.h"
#import "NSData+Z.h"

#define ChunkSizeForReadingData 4096

@implementation NSFileManager (md5)

- (NSData *)md5DigestAtPath:(NSString *)filePath
{
	NSData *digestData = nil;
	CFURLRef fileURL = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, (CFStringRef)filePath, kCFURLPOSIXPathStyle, (Boolean)false);
	if (fileURL) {
		CFReadStreamRef readStream = CFReadStreamCreateWithFile(kCFAllocatorDefault, (CFURLRef)fileURL);
		if (readStream) {
			if (CFReadStreamOpen(readStream)) {

				CC_MD5_CTX hashObject;
				CC_MD5_Init(&hashObject);
				uint8_t buffer[ChunkSizeForReadingData];
				CFIndex bytesRead = 0;
				while ((bytesRead = CFReadStreamRead(readStream, (UInt8 *)buffer, (CFIndex)sizeof(buffer))) > 0) {
					CC_MD5_Update(&hashObject, (const void *)buffer, (CC_LONG)bytesRead);
				}
				unsigned char digest[CC_MD5_DIGEST_LENGTH];
				CC_MD5_Final(digest, &hashObject);
				digestData = [NSData dataWithBytes:digest length:CC_MD5_DIGEST_LENGTH];
				CFReadStreamClose(readStream);
			}
			CFRelease(readStream);
		}
		CFRelease(fileURL);
	}
	return digestData;
}

- (NSData *)md5DigestAtPath2:(NSString *)filePath
{
	// Declare needed variables
	NSData *digestData = nil;
	CFReadStreamRef readStream = NULL;

	// Get the file URL
	CFURLRef fileURL = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, (CFStringRef)filePath, kCFURLPOSIXPathStyle, (Boolean)false);
	if (!fileURL) goto done;

	// Create and open the read stream
	readStream = CFReadStreamCreateWithFile(kCFAllocatorDefault, (CFURLRef)fileURL);
	if (!readStream) goto done;
	bool didSucceed = (bool)CFReadStreamOpen(readStream);
	if (!didSucceed) goto done;

	// Initialize the hash object
	CC_MD5_CTX hashObject;
	CC_MD5_Init(&hashObject);

	// Feed the data to the hash object
	bool hasMoreData = true;
	while (hasMoreData) {
		uint8_t buffer[ChunkSizeForReadingData];
		CFIndex readBytesCount = CFReadStreamRead(readStream, (UInt8 *)buffer, (CFIndex)sizeof(buffer));
		if (readBytesCount == -1) break;
		if (readBytesCount == 0) {
			hasMoreData = false;
			continue;
		}
		CC_MD5_Update(&hashObject, (const void *)buffer, (CC_LONG)readBytesCount);
	}

	// Check if the read operation succeeded
	didSucceed = !hasMoreData;

	// Compute the hash digest
	unsigned char digest[CC_MD5_DIGEST_LENGTH];
	CC_MD5_Final(digest, &hashObject);

	digestData = [NSData dataWithBytes:digest length:CC_MD5_DIGEST_LENGTH];

done:
    
    if (readStream) {
        CFReadStreamClose(readStream);
        CFRelease(readStream);
    }
    if (fileURL) {
        CFRelease(fileURL);
    }
    return digestData;
}

- (NSString *)md5DigestStringAtPath:(NSString *)filePath
{
	return [[self md5DigestAtPath:filePath] hexadecimalString];
}

@end
