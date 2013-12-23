//
//  UIHelper.m
//  Connection
//
//  Created by 寿宝江 on 13-12-16.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "UIHelper.h"

@implementation UIHelper
static NSMutableArray* helpers;

+ (UIHelper*) getUIHelper
{
    //if (helper == nil) {
    //    helper = [[UIHelper alloc] init];
    //}
    if (helpers == nil) {
        helpers = [[NSMutableArray alloc] init];
    }
    UIHelper* helper = [[UIHelper alloc] init];
    [helpers addObject:helper];
    return helper;
}

+ (void) releaseUIHelper
{
    [helpers removeAllObjects];
}

- (UIDatePicker*) getDatePicker
{
    _datePicker = [[UIDatePicker alloc] init];
    _datePicker.datePickerMode = UIDatePickerModeDate;
    return _datePicker;
}

- (UIPickerView*) getItemPicker
{
    UIPickerView* picker = [[UIPickerView alloc] init];
    [picker setDataSource:self];
    [picker setDelegate:self];
    return picker;
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_items count];
}
- (NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_items objectAtIndex:row];
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _selectedRow = row;
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

- (UIBarPosition) positionForBar:(id<UIBarPositioning>)bar
{
    return UIBarPositionTop;
}

- (IBAction)dateOkClick:(id)sender
{
    [_delegate performSelector:_setAction withObject:[_datePicker date]];
}

- (IBAction)itemOKClick:(id)sender
{
    NSString* item = [_items objectAtIndex:_selectedRow];
    [_delegate performSelector:_setAction withObject:item];
}

- (void) setDatePickerForTextField:(UITextField *)textField :(SEL)setDateAction :(id) delegate
{
    textField.inputView = [self getDatePicker];
    textField.inputAccessoryView = [self getToolbar];
    [_okBtn setTarget:self];
    [_okBtn setAction:@selector(dateOkClick:)];
    [_pickerToolBar setDelegate:self];
    _delegate = delegate;
    _setAction = setDateAction;
}

- (void) setStrPickerForTextField:(UITextField *)textField :(SEL)setItemAction :(id)delegate :(NSArray*) strItems;
{
    textField.inputView = [self getItemPicker];
    textField.inputAccessoryView = [self getToolbar];
    [_okBtn setTarget:self];
    [_okBtn setAction:@selector(itemOKClick:)];
    _delegate = delegate;
    _setAction = setItemAction;
    _items = strItems;
}
@end
