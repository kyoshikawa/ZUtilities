//
//  ZGestureRecognizer.h
//
//  Created by Kaz Yoshikawa on 10/09/18.
//  Copyright 2010 Electricwoods. All rights reserved.
//

#import <Foundation/Foundation.h>


//
//	ZPanGestureRecognizer
//

@interface ZPanGestureRecognizer : UIPanGestureRecognizer
{
	id context;
}
@property (retain) id context;

@end



//
//	ZPinchGestureRecognizer
//

@interface ZPinchGestureRecognizer : UIPinchGestureRecognizer
{
	id context;
}
@property (retain) id context;

@end


//
//	ZRotationGestureRecognizer
//

@interface ZRotationGestureRecognizer : UIRotationGestureRecognizer
{
	id context;
}
@property (retain) id context;

@end


//
//
//

@interface ZTapGestureRecognizer : UITapGestureRecognizer
{
	id context;
}
@property (retain) id context;

@end
