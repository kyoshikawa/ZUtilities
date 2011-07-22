//
//  ZGrossyButton.h
//
//  Created by Kaz Yoshikawa on 11/02/06.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ZColorUtils.h"


//
//	ZGlossyButton
//
@interface ZGlossyButton : UIButton
{
	UIColor *tintColor;
	CGGradientRef gradientRef;
//	NSMutableSet *activeTouches;
}
@property (retain) UIColor *tintColor;

@end
