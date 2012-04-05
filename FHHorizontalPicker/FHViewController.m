//
//  FHViewController.m
//  FHHorizontalPicker
//
//  Created by Florian Heller on 3/30/12.
//  Copyright (c) 2012 RWTH Aachen University. All rights reserved.
//

#import "FHViewController.h"

@interface FHViewController ()

@end

@implementation FHViewController
@synthesize myPicker;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	myPicker.dataSource = self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (NSUInteger)numberOfItemsInPickerView:(FHHorizontalPickerView *)pickerView;
{
	return 14;
}

- (UIView *)pickerView:(FHHorizontalPickerView *)pickerView viewAtIndex:(NSUInteger)index;
{
	UIButton *newView = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	newView.frame = CGRectMake(0, 10, 70, 70);
	[newView setTitle:[NSString stringWithFormat:@"%d",index] forState:UIControlStateNormal];
	return newView;
}


@end
