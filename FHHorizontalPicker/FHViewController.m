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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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

@end
