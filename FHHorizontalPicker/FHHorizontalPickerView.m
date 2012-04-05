//
//  FHHorizontalPickerView.m
//  FHHorizontalPickerView
//
//  Created by Florian Heller on 3/30/12.
//  Copyright (c) 2012 RWTH Aachen University. All rights reserved.
//
// This is a special version of the scrollview. 
// The PickerContentView inside this scrollview is the drawing board, where we place all the subviews

#import "FHHorizontalPickerView.h"

@interface FHHorizontalPickerView ()
{
	FHPickerContentView *contentView;
}

@property (strong)	NSMutableArray *indexedSubViews;
@property (strong)	FHPickerContentView* contentView;
@end

@implementation FHHorizontalPickerView
@synthesize indexedSubViews,contentView,dataSource;

// Both initWithCoder and initWithFrame are implemented to work both when loaded from a nib of from code
- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {

		self.contentView = [[FHPickerContentView alloc] initWithFrame:self.bounds];
		self.contentView.delegate = self;
		[self addSubview:contentView];

		// TODO: need to center the currently centered item when changing screen orientation
		float centerDistance = self.bounds.size.width/2;
		self.contentView.padding = 100;
		self.contentView.frame = self.bounds;
		self.contentInset = UIEdgeInsetsMake(0, centerDistance, 0, centerDistance);
		
		
		self.showsHorizontalScrollIndicator = NO;
		self.showsVerticalScrollIndicator = NO;
		self.pagingEnabled = NO;
		self.delegate = self;	//We are our own scrollview delegate
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
	if (self) {

		self.contentView = [[FHPickerContentView alloc] initWithFrame:self.bounds];
		self.contentView.delegate = self;
		[self addSubview:contentView];

		float centerDistance = self.bounds.size.width/2;
		self.contentView.padding = 100;
		self.contentView.frame = self.bounds;
		self.contentInset = UIEdgeInsetsMake(0, centerDistance, 0, centerDistance);
		
		self.showsHorizontalScrollIndicator = NO;
		self.showsVerticalScrollIndicator = NO;
		self.pagingEnabled = NO;
		self.delegate = self;	//We are our own scrollview delegate
    }
    return self;
}

#pragma mark - Load Views
- (void)layoutSubviews
{

	if ([self.contentView.subviews count] == 0)//Is this clever or should we track it with an own bool?
		[self loadViews];
}

//Ask the delegate how many views there are and ask it pass them to us
// This actually should be extended to something like the tableviews that reuses views. 
// In the case that we have a large number of subviews, we could discard those offscreen and add new ones that will come up
- (void)loadViews;
{
	NSUInteger numberOfItems = [self.dataSource numberOfItemsInPickerView:self];
	
	for (int i=0; i<numberOfItems; i++)
	{
		[self.contentView addSubview:[self.dataSource pickerView:self viewAtIndex:i]];
		
	}
}

- (void)reloadViews
{
	for (UIView *aView in self.contentView.subviews)
	{
		[aView removeFromSuperview];
	}
	[self loadViews];
}

#pragma mark - ScrollViewDelegateMethods
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
	//Center the item closest to the target
	// Find out at which index we will be
	CGFloat minOffset = INT_MAX;
	CGPoint pointToSnapTo;
	for (UIView* aView in contentView.subviews)
	{
		CGFloat distance = fabs(aView.center.x - (targetContentOffset->x)-self.contentInset.left);
		if (distance < minOffset)
		{
			minOffset = distance;
			pointToSnapTo = aView.center;
		}
	}
	// We now need to set the content offset such that the item with the minimum distance gets centered.
	// !This doesn't if we aim at the outer left border, that's why we add 0.0001, which ist not visible
	targetContentOffset->x = pointToSnapTo.x-self.contentInset.left+0.0001;
}


#pragma mark - PickerContentViewDelegate Methods
- (void)contentView:(FHPickerContentView*)pickerContentView didChangeSize:(CGSize)newSize;
{
	self.contentSize = self.contentView.frame.size;
	self.contentView.center = CGPointMake(self.contentView.frame.size.width/2, self.bounds.size.height/2);
}

#pragma mark - Custom getters/setters
- (void)setItemPadding:(CGFloat)itemPadding
{
	self.contentView.padding = itemPadding;
	[self.contentView setNeedsLayout];
}
- (CGFloat)itemPadding
{
	return self.contentView.padding;
}

@end
