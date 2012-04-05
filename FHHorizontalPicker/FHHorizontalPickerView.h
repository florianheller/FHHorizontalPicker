//
//  FHHorizontalPickerView.h
//  FHHorizontalPickerView
//
//  Created by Florian Heller on 3/30/12.
//  Copyright (c) 2012 RWTH Aachen University. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "FHPickerContentView.h"
@class FHHorizontalPickerView;

@protocol FHHorizontalPickerDataSource
- (NSUInteger)numberOfItemsInPickerView:(FHHorizontalPickerView *)pickerView;
- (UIView *)pickerView:(FHHorizontalPickerView *)pickerView viewAtIndex:(NSUInteger)index; 
@end

@interface FHHorizontalPickerView : UIScrollView <UIScrollViewDelegate,FHPickerContentViewDelegate>

@property (unsafe_unretained) id<FHHorizontalPickerDataSource> dataSource;
@property (nonatomic, assign) CGFloat itemPadding;

@end
