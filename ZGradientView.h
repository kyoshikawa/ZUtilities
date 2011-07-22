//
//  ZGradientView.h
//
//  Created by Kaz Yoshikawa on 11/02/17.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>


@interface ZGradientView : UIView
{
}
@property (readonly) CAGradientLayer *gradientLayer;

- (void)setTintColor:(UIColor *)aTintColor;

@end
