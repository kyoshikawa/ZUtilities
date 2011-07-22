//
//  ZObjectKeyedDictionary.m
//
//  Created by Kaz Yoshikawa on 10/02/12.
//  Copyright 2010 Electricwoods LLC. All rights reserved.
//

#import "ZObjectKeyedDictionary.h"


@implementation ZObjectKeyedDictionary

+ (id)dictionary
{
	return [[[ZObjectKeyedDictionary alloc] init] autorelease];
}

- (id)initWithCapacity:(NSUInteger)numItems
{
	if ((self = [super init])) {
		dictionaryRef = CFDictionaryCreateMutable(NULL, numItems, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
	}
	return self;
}

- (id)init
{
	if ((self = [super init])) {
		dictionaryRef = CFDictionaryCreateMutable(NULL, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
	}
	return self;
}

- (id)objectForKey:(id)aKey
{
	if (dictionaryRef) {
		return (id)CFDictionaryGetValue(dictionaryRef, aKey);
	}
	return nil;
}

- (void)setObject:(id)anObject forKey:(id)aKey
{
	if (dictionaryRef) {
		if (anObject) {
			CFDictionarySetValue(dictionaryRef, aKey, anObject);
		}
		else {
			CFDictionaryRemoveValue(dictionaryRef, aKey);
		}

	}
}

- (NSArray *)allKeys
{
	if (dictionaryRef) {
		CFIndex count = CFDictionaryGetCount(dictionaryRef);
		id keys[count];
		CFDictionaryGetKeysAndValues(dictionaryRef, (const void **)keys, NULL);
		return [NSArray arrayWithObjects:keys count:count];
	}
	return nil;
}

- (NSArray *)allValues
{
	if (dictionaryRef) {
		CFIndex count = CFDictionaryGetCount(dictionaryRef);
		id values[count];
		CFDictionaryGetKeysAndValues(dictionaryRef, NULL, (const void **)values);
		NSArray *allValues = [NSArray arrayWithObjects:values count:count];
		NSParameterAssert([allValues count] == count);
		return allValues;
	}
	return nil;
}

- (void) dealloc
{
	if (dictionaryRef) CFRelease(dictionaryRef);
	[super dealloc];
}

- (id)valueForKey:(NSString *)key
{
	NSAssert(NO, @"Try using objectForKey:");
	return [self objectForKey:key];
}

- (void)setValue:(id)value forKey:(NSString *)key
{
	NSAssert(NO, @"Try using setObject:forKey:");
	[self setObject:value forKey:key];
}

@end
