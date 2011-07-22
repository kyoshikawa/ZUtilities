//
//  UITableView+Z.m
//
//  Created by Kaz Yoshikawa on 11/02/04.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import "UITableView+Z.h"


//
//	UITableView
//
@implementation UITableView (Z)

- (void)reloadDataAfterDelay:(NSTimeInterval)aDelay
{
	[self performSelector:@selector(reloadData) withObject:nil afterDelay:aDelay];
}

@end
