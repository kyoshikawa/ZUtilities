//
//  ZGestureRecognizer.m
//
//  Created by Kaz Yoshikawa on 10/09/18.
//  Copyright 2010 Electricwoods. All rights reserved.
//

#import "ZGestureRecognizer.h"


//
//	ZPanGestureRecognizer
//

@implementation ZPanGestureRecognizer

@synthesize context;

- (void)dealloc
{
	self.context = nil;
	[super dealloc];
}

@end


//
//	ZPinchGestureRecognizer
//

@implementation ZPinchGestureRecognizer

@synthesize context;

- (void)dealloc
{
	self.context = nil;
	[super dealloc];
}

@end


//
//	ZRotationGestureRecognizer
//

@implementation ZRotationGestureRecognizer

@synthesize context;

- (void)dealloc
{
	self.context = nil;
	[super dealloc];
}

@end

//
//	ZTapGestureRecognizer
//

@implementation ZTapGestureRecognizer

@synthesize context;

- (void)dealloc
{
	self.context = nil;
	[super dealloc];
}

@end




