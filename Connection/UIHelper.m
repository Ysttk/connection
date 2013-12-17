//
//  UIHelper.m
//  Connection
//
//  Created by 寿宝江 on 13-12-16.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "UIHelper.h"

@implementation UIHelper
static UIDatePicker* datePicker;
static UIToolbar* pickerToolBar;
static UIBarButtonItem* okBtn;
static UIHelper* helper;

+ (UIHelper*) getUIHelper
{
    if (helper == nil) {
        helper = [[UIHelper alloc] init];
    }
    return helper;
}

+ (UIDatePicker*) getDatePicker
{
    if (datePicker == nil) {
        datePicker = [[UIDatePicker alloc] init];
        datePicker.datePickerMode = UIDatePickerModeDate;
    }
    return datePicker;
}

+ (UIToolbar*) getToolbar
{
    if (pickerToolBar == nil) {
        pickerToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] applicationFrame].size.width,  30)];
        okBtn = [[UIBarButtonItem alloc] initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:nil action:nil];
            UIBarButtonItem* placeHolder = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        NSArray* items = [NSArray arrayWithObjects: placeHolder, okBtn, nil];
        [pickerToolBar setItems:items];
    }
    return pickerToolBar;
}

- (UIBarPosition) positionForBar:(id<UIBarPositioning>)bar
{
    return UIBarPositionTop;
}

- (IBAction)okClick:(id)sender
{
    [_delegate performSelector:_setDateAction withObject:[datePicker date]];
    
}

- (void) setDatePickerForTextField:(UITextField *)textField :(SEL)setDateAction :(id) delegate
{
    textField.inputView = [UIHelper getDatePicker];
    textField.inputAccessoryView = [UIHelper getToolbar];
    [okBtn setTarget:self];
    [okBtn setAction:@selector(okClick:)];
    [pickerToolBar setDelegate:self];
    _delegate = delegate;
    _setDateAction = setDateAction;
}
@end
