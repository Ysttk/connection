//
//  DatePickerHelper.h
//  Connection
//
//  Created by 寿宝江 on 14-2-5.
//  Copyright (c) 2014年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIHelperBase.h"

@interface DatePickerHelper : UIHelperBase <UIToolbarDelegate>

@property (nonatomic, retain) id delegate;
@property (nonatomic, assign) SEL setAction;
@property (nonatomic, retain) UIDatePicker* datePicker;


@property (nonatomic, retain) UIToolbar* pickerToolBar;
@property (nonatomic, retain) UIBarButtonItem* okBtn;
- (id) init:(UITextField *)textField :(SEL)setDateAction :(id) delegate;

@end
