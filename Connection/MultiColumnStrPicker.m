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
    NSMutableArray* targetArray = nil;
    NSMutableArray* preArray = _items;
    for (int i=1; i<_totalComponts; i++) {
        NSNumber* idx = [_selectedRows objectAtIndex:i];
        preArray = [preArray objectAtIndex:idx.intValue];
    }
    targetArray = preArray;
    return targetArray.count;
}


- (NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSMutableArray* targetArray = _items;
    for (int i=1; i<_totalComponts; i++) {
        NSNumber* idx = [_selectedRows objectAtIndex:i];
        targetArray = [targetArray objectAtIndex:idx.intValue];
    }
    return [targetArray objectAtIndex:row];
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

    [_selectedRows replaceObjectAtIndex:component withObject:[NSNumber numberWithInt:row]];
    
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
//    CGFloat leftWidth = swidth - _okBtn.width - 15 -110;
    //_itemSearch = [[UISearchBar alloc] initWithFrame:CGRectMake(15, 0, leftWidth, 30)];
    //_itemSearch.tag = 1;
//    _itemSearch.barStyle = UIBarStyleDefault;
//    _itemSearch.delegate = self;
//    _itemSearch.userInteractionEnabled = TRUE;
//    for (UIView* view in _itemSearch.subviews) {
//        //        if ([view isKindOfClass:[UIButton class]]) {
//        //            UIButton* b = (UIButton*) view;
//        //            b.enabled = YES;
//        //            break;
//        //        }
//        if ([view isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
//            [view removeFromSuperview];
//            break;
//        }
//    }
//    _itemSearch.showsCancelButton = YES;
//    [_itemSearch setShowsCancelButton:YES animated:YES];
//    UIView* searchContainer = [[UIView alloc] initWithFrame:_itemSearch.frame];
//    searchContainer.backgroundColor = [UIColor whiteColor];
//    _itemSearch.backgroundColor = [UIColor whiteColor];
//    [searchContainer addSubview:_itemSearch];
//    [_pickerToolBar addSubview:searchContainer];
    [_pickerToolBar setItems:items];
    return _pickerToolBar;
}

- (IBAction)itemOKClick:(id)sender
{
    NSString* item;

        NSMutableArray* set = _items;
        for (int idx=0; idx<_totalComponts-1; idx++) {
            NSNumber* number = [_selectedRows objectAtIndex:idx];
            int i = number.intValue;
            set = [set objectAtIndex:i];
        }
        NSNumber* number = [_selectedRows objectAtIndex:_totalComponts-1];
        int i = number.intValue;
        item = [set objectAtIndex:i];
    
    [_delegate performSelector:_setAction withObject:item];
}


- (id) init:(UITextField *)textField :(SEL)setItemAction :(id)delegate :(NSArray *)strItems :(int) depth
{
    self = [super init];

    textField.inputView = [self getItemPicker];
    textField.inputAccessoryView = [self getToolbar];
    [_okBtn setTarget:self];
    [_okBtn setAction:@selector(itemOKClick:)];
    _delegate = delegate;
    _setAction = setItemAction;
    _items = [strItems mutableCopy];
    _selectedItems = [[NSMutableArray alloc] initWithArray:_items];
    _selectedRows = [[NSMutableArray alloc] init];
    for (int i=0; i<depth; i++)
        [_selectedRows addObject:[NSNumber numberWithInt:0]];
    _totalComponts = depth;
    return self;
}



@end
