//
//  FHViewController.h
//  FHHorizontalPicker
//
//  Created by Florian Heller on 3/30/12.
//  Copyright (c) 2012 RWTH Aachen University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FHHorizontalPickerView.h"

@interface FHViewController : UIViewController<FHHorizontalPickerDataSource>

@property (strong) IBOutlet FHHorizontalPickerView* myPicker;

@end
