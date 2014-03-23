//
//  MultiColumnStrPickerWithSearchAndInput.m
//  Connection
//
//  Created by 寿宝江 on 14-2-9.
//  Copyright (c) 2014年 Org. All rights reserved.
//

#import "MultiColumnStrPicker.h"

@implementation MultiColumnStrPicker

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return _totalComponts;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return _items.count;
    } else {
        NSArray* array = _items;
        for (int idx=0; idx<component; idx++) {
            int compIdx = [pickerView selectedRowInComponent:idx];
            NSDictionary* dic = [array objectAtIndex:compIdx];
            array = [dic objectForKey:_DataKey];
        }
        return array.count;
    }
}


- (NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSNumber* idx = [_selectedRows objectAtIndex:0];
    NSDictionary* dic = [_items objectAtIndex:idx.intValue];
    if (component == 0) {
        dic = [_items objectAtIndex:row];
        NSString* strItem = [dic objectForKey:_KeyKey];
        return strItem;
    } else {
        NSArray* array = _items;
        for (int columnIdx=0; columnIdx<component; columnIdx++) {
            int compIdx = [pickerView selectedRowInComponent:columnIdx];
            dic = [array objectAtIndex:compIdx];
            array = [dic objectForKey:_DataKey];
        }
        //int compIdx = [pickerView selectedRowInComponent:component];
        id item = [array objectAtIndex:row];
        if ([item isKindOfClass:[NSDictionary class]]) {
            return [item objectForKey:_KeyKey];
        } else if ([item isKindOfClass:[NSString class]]) {
            return item;
        } else {
            return nil;
        }
    }
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [_selectedRows replaceObjectAtIndex:component withObject:[NSNumber numberWithInt:row]];
    for (int compIdx=component; compIdx<_totalComponts; compIdx++)
        [pickerView reloadComponent:compIdx];
}

- (UIPickerView*) getItemPicker
{
    UIPickerView* picker = [[UIPickerView alloc] init];
    [picker setDataSource:self];
    [picker setDelegate:self];
    _itemPicker = picker;
    return picker;
}

- (UIToolbar*) getToolbar
{
    CGFloat swidth = [[UIScreen mainScreen]applicationFrame].size.width;
    _pickerToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] applicationFrame].size.width,  30 )];
    
    _okBtn = [[UIBarButtonItem alloc] initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:nil action:nil];
    UIBarButtonItem* placeHolder = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray* items = [NSArray arrayWithObjects:placeHolder, _okBtn, nil];
    [_pickerToolBar setItems:items];
    return _pickerToolBar;
}

- (IBAction)itemOKClick:(id)sender
{
    NSString* item;

    NSArray* set = _items;
    for (int idx=0; idx<_totalComponts-1; idx++) {
        NSNumber* number = [_selectedRows objectAtIndex:idx];
        int i = number.intValue;
        NSDictionary* dic = [set objectAtIndex:i];
        set = [dic objectForKey:_DataKey];
    }
    NSNumber* number = [_selectedRows objectAtIndex:_totalComponts-1];
    int i = number.intValue;
    item = [set objectAtIndex:i];

    [_delegate performSelector:_setAction withObject:item];
}


- (id) init:(UITextField *)textField :(SEL)setItemAction :(id)delegate :(NSArray *)strItems :(int) depth :(NSString*) aKeyKey :(NSString*) aDataKey
{
    self = [super init];

    textField.inputView = [self getItemPicker];
    textField.inputAccessoryView = [self getToolbar];
    [_okBtn setTarget:self];
    [_okBtn setAction:@selector(itemOKClick:)];
    _delegate = delegate;
    _setAction = setItemAction;
    _items = [strItems mutableCopy];
    _selectedRows = [[NSMutableArray alloc] init];
    _totalComponts = depth+1;
    for (int i=0; i<_totalComponts; i++)
        [_selectedRows addObject:[NSNumber numberWithInt:0]];
    _KeyKey = aKeyKey;
    _DataKey = aDataKey;
    return self;
}



@end
