//
//  StrPickerHelper.m
//  Connection
//
//  Created by 寿宝江 on 14-2-6.
//  Copyright (c) 2014年 Org. All rights reserved.
//

#import "StrPickerHelper.h"

@implementation StrPickerHelper

- (UIPickerView*) getItemPicker
{
    UIPickerView* picker = [[UIPickerView alloc] init];
    [picker setDataSource:self];
    [picker setDelegate:self];
    _itemPicker = picker;
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

- (IBAction)itemOKClick:(id)sender
{
    NSString* item;
    item = [_items objectAtIndex:_selectedRow];
    [_delegate performSelector:_setAction withObject:item];
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


- (id) init:(UITextField *)textField :(SEL)setItemAction :(id)delegate :(NSArray*) strItems
{
    self = [super init];
    textField.inputView = [self getItemPicker];
    textField.inputAccessoryView = [self getToolbar];
    [_okBtn setTarget:self];
    [_okBtn setAction:@selector(itemOKClick:)];
    _delegate = delegate;
    _setAction = setItemAction;
    _items = [strItems mutableCopy];
    return self;
}

@end
