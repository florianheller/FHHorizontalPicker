//
//  FHPickerContentView.h
//  FHHorizontalPicker
//
//  Created by Florian Heller on 3/30/12.
//  Copyright (c) 2012 RWTH Aachen University. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FHPickerContentView;

@protocol FHPickerContentViewDelegate <NSObject>
- (void)contentView:(FHPickerContentView*)pickerContentView didChangeSize:(CGSize)newSize;
@end

@interface FHPickerContentView : UIView

@property (assign) CGFloat padding;
@property (unsafe_unretained) id<FHPickerContentViewDelegate> delegate; 

@end
