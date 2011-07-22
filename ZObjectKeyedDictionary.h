//
//  ZObjectKeyedDictionary.h
//
//  Created by Kaz Yoshikawa on 10/02/12.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


//	ZObjectKeyedDictionary
//
//	This dictionary does not make a copy of keys, unlike NSMutableDictionary.
//	So, the key object does not have to conform to NSCopying protocol.

@interface ZObjectKeyedDictionary : NSObject
{
	CFMutableDictionaryRef dictionaryRef;
}

+ (id)dictionary;
- (id)initWithCapacity:(NSUInteger)numItems;
- (id)objectForKey:(id)aKey;
- (void)setObject:(id)anObject forKey:(id)aKey;
- (NSArray *)allKeys;
- (NSArray *)allValues;

@end
