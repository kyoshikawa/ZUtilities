//
//  NSData+Z.h
//
//  Created by Kaz Yoshikawa on 3/14/10.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSData (Z)

+ (NSData *)dataNamed:(NSString *)aName;
- (BOOL)writeToFile:(NSString *)path createIntermediateDirectories:(BOOL)aCreateIntermediates error:(NSError **)errorPtr;
- (NSString *)hexadecimalString;
- (NSData *)sha1Digest;
- (NSData *)md5Digest;
- (NSString *)sha1DigestString;
- (NSString *)md5DigestString;
- (NSDictionary *)propertyList;

@end
