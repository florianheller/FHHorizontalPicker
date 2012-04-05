//
//  FHPickerContentView.m
//  FHHorizontalPicker
//
//  Created by Florian Heller on 3/30/12.
//  Copyright (c) 2012 RWTH Aachen University. All rights reserved.
//

#import "FHPickerContentView.h"

@implementation FHPickerContentView
@synthesize padding,delegate;

- (void)layoutSubviews
{
	[super layoutSubviews];
	//Place the subviews at <padding> distance to each other
	CGFloat newCenterX = 0;	
	for (UIView* aView in self.subviews)
	{
		aView.center = CGPointMake(newCenterX, aView.center.y);
		newCenterX += self.padding;
	}
	// Adjust the bounds of our contentView to represent the current width including all subviews
	CGRect boundsCopy = self.bounds;
	boundsCopy.size.width = newCenterX-self.padding;
	self.bounds = boundsCopy;
	
	//Inform the delegate that our size has changed
	if ([delegate respondsToSelector:@selector(contentView:didChangeSize:)])
		 [delegate contentView:self didChangeSize:self.bounds.size];
}

@end
