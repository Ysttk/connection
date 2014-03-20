//
//  MultiColumnStrPickerWithSearchAndInput.m
//  Connection
//
//  Created by 寿宝江 on 14-2-9.
//  Copyright (c) 2014年 Org. All rights reserved.
//

#import "MultiColumnStrPickerWithSearch.h"

@implementation MultiColumnStrPickerWithSearch

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

- (UIToolbar*) getToolbarWithSearchbar
{
    CGFloat swidth = [[UIScreen mainScreen]applicationFrame].size.width;
    _pickerToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] applicationFrame].size.width,  30 )];
    
    _okBtn = [[UIBarButtonItem alloc] initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:nil action:nil];
    UIBarButtonItem* placeHolder = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray* items = [NSArray arrayWithObjects:placeHolder, _okBtn, nil];
    CGFloat leftWidth = swidth - _okBtn.width - 15 -110;
    _itemSearch = [[UISearchBar alloc] initWithFrame:CGRectMake(15, 0, leftWidth, 30)];
    //_itemSearch.tag = 1;
    _itemSearch.barStyle = UIBarStyleDefault;
    _itemSearch.delegate = self;
    _itemSearch.userInteractionEnabled = TRUE;
    for (UIView* view in _itemSearch.subviews) {
        //        if ([view isKindOfClass:[UIButton class]]) {
        //            UIButton* b = (UIButton*) view;
        //            b.enabled = YES;
        //            break;
        //        }
        if ([view isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            [view removeFromSuperview];
            break;
        }
    }
    _itemSearch.showsCancelButton = YES;
    [_itemSearch setShowsCancelButton:YES animated:YES];
    UIView* searchContainer = [[UIView alloc] initWithFrame:_itemSearch.frame];
    searchContainer.backgroundColor = [UIColor whiteColor];
    _itemSearch.backgroundColor = [UIColor whiteColor];
    [searchContainer addSubview:_itemSearch];
    [_pickerToolBar addSubview:searchContainer];
    [_pickerToolBar setItems:items];
    return _pickerToolBar;
}

- (IBAction)itemOKClick:(id)sender
{
    NSString* item;
    if ([_selectedItems count] == 0) return;
    //item = [_selectedItems objectAtIndex:_selectedRow];
    [_tmpObj removeFromSuperview];
    _isEditSearchBar = NO;
    [_itemSearch resignFirstResponder];
    [_delegate performSelector:_setAction withObject:item];
}


- (void) keyboardWillShowNotification:(NSNotification*) sender
{
    if (_isEditSearchBar) {
        UIViewController* controller = _delegate;
        UIView* rootView = controller.view;
        CGSize size = [[UIScreen mainScreen] applicationFrame].size;
        UIPickerView* tmpPick = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 100, size.width, 300)];
        tmpPick.delegate = self;
        tmpPick.dataSource = self;
        [rootView addSubview:tmpPick];
        tmpPick.backgroundColor = [UIColor whiteColor];
        _tmpObj = tmpPick;
    }
}

- (void) keyboardWillHideNotification:(id) sender
{
    if (_isEditSearchBar) {
        UIPickerView* pick = _tmpObj;
        [pick removeFromSuperview];
        _tmpObj = nil;
    }
}

- (id) init:(UITextField *)textField :(SEL)setItemAction :(id)delegate :(NSArray *)strItems
{
    self = [super init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
    textField.inputView = [self getItemPicker];
    textField.inputAccessoryView = [self getToolbarWithSearchbar];
    [_okBtn setTarget:self];
    [_okBtn setAction:@selector(itemOKClick:)];
    _delegate = delegate;
    _setAction = setItemAction;
    _items = [strItems mutableCopy];
    _selectedItems = [[NSMutableArray alloc] initWithArray:_items];
    return self;
}



@end
