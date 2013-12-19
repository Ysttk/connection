//
//  UIHelper.h
//  Connection
//
//  Created by 寿宝江 on 13-12-16.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIHelper : NSObject <UIToolbarDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, retain) id delegate;
@property (nonatomic, assign) SEL setAction;

@property (nonatomic, retain) UIToolbar* pickerToolBar;
@property (nonatomic, retain) UIBarButtonItem* okBtn;

//for date picker
@property (nonatomic, retain) UIDatePicker* datePicker;

//for item picker
@property (nonatomic, retain) UIPickerView* itemPicker;
@property (nonatomic, retain) NSArray* items;

- (void) setDatePickerForTextField: (UITextField*) textField :(SEL)setDateAction :(id) delegate;
- (void) setStrPickerForTextField: (UITextField*) textField :(SEL) setItemAction :(id) delegate :(NSArray*) array;

+ (UIHelper*) getUIHelper;
+ (void) releaseUIHelper;
@end
