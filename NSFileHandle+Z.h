//
//  NSFileHandle+Z.h
//
//  Created by Kaz Yoshikawa on 11/02/12.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSFileHandle (Z)

- (int32_t)readInt32;
- (uint32_t)readUInt32;
- (void)writeInt32:(int32_t)aValue;
- (void)writeUInt32:(uint32_t)aValue;

@end
