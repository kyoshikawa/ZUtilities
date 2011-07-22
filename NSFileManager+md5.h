//
//  NSFileManager+md5.h
//
//  Created by Kaz Yoshikawa on 11/04/10.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSFileManager (md5)

- (NSData *)md5DigestAtPath:(NSString *)filePath;
- (NSString *)md5DigestStringAtPath:(NSString *)filePath;

@end
