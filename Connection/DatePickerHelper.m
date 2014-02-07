//
//  DatePickerHelper.m
//  Connection
//
//  Created by 寿宝江 on 14-2-5.
//  Copyright (c) 2014年 Org. All rights reserved.
//

#import "DatePickerHelper.h"

@implementation DatePickerHelper

- (UIBarPosition) positionForBar:(id<UIBarPositioning>)bar
{
    return UIBarPositionTop;
}

- (IBAction)dateOkClick:(id)sender
{
    [_delegate performSelector:_setAction withObject:[_datePicker date]];
}

- (UIDatePicker*) getDatePicker
{
    _datePicker = [[UIDatePicker alloc] init];
    _datePicker.datePickerMode = UIDatePickerModeDate;
    return _datePicker;
}

- (UIToolbar*) getToolbar
{
    _pickerToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] applicationFrame].size.width,  30)];
    _okBtn = [[UIBarButtonItem alloc] initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:nil action:nil];
    UIBarButtonItem* placeHolder = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray* items = [NSArray arrayWithObjects: placeHolder, _okBtn, nil];
    [_pickerToolBar setItems:items];
    return _pickerToolBar;
}

- (id) init:(UITextField *)textField :(SEL)setDateAction :(id) delegate
{
    self = [super init];
    textField.inputView = [self getDatePicker];
    textField.inputAccessoryView = [self getToolbar];
    [_okBtn setTarget:self];
    [_okBtn setAction:@selector(dateOkClick:)];
    [_pickerToolBar setDelegate:self];
    _delegate = delegate;
    _setAction = setDateAction;
    return self;
}
@end
