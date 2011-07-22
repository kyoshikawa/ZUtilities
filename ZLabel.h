//
//  ZLabel.h
//
//  Created by Kaz Yoshikawa on 3/5/10.
//  Copyright Electricwoods LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


//	Description:
//
//	ZLabel is designed for UILabel with drop shadow.
//	You can specify 'shadow offset' or 'shadow blur radius'. Optionally,
//	you can specify the color of the shadow


//
//	ZLabel
//
@interface ZLabel : UILabel
{
	CGFloat shadowBlur_;
	UIColor *tintColor_;
}
@property (assign) CGFloat shadowBlur;
@property (retain) UIColor *tintColor;


@end
