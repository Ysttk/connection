//
//  MultiSelectStrPickerWithSearchAndInputHelper.m
//  Connection
//
//  Created by 寿宝江 on 14-2-7.
//  Copyright (c) 2014年 Org. All rights reserved.
//

#import "MultiSelectStrPickerWithSearch_InputHelper.h"

@implementation MultiSelectStrPickerWithSearch_InputHelper

- (UIPickerView*) getItemPicker
{
    UIPickerView* picker = [[UIPickerView alloc] init];
    [picker setDataSource:self];
    [picker setDelegate:self];
    _itemPicker = picker;
    return picker;
}

- (UIToolbar*) getToolbarWithSearchbarAndInput
{
    CGFloat swidth = [[UIScreen mainScreen]applicationFrame].size.width;
    _pickerToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] applicationFrame].size.width,  30 )];
    
    _okBtn = [[UIBarButtonItem alloc] initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:nil action:nil];
    UIBarButtonItem* addBtn = [[UIBarButtonItem alloc] initWithTitle:@"新增" style:UIBarButtonItemStyleDone target:self action:@selector(showAddNewItem:)];
    addBtn.width = 40;
    UIBarButtonItem* placeHolder = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem* fixHolder = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    fixHolder.width = 20;
    fixHolder.enabled = FALSE;
    NSArray* items = [NSArray arrayWithObjects:placeHolder, fixHolder, addBtn, _okBtn, nil];
    CGFloat leftWidth = swidth - _okBtn.width - 15 -110;
    _itemSearch = [[UISearchBar alloc] initWithFrame:CGRectMake(15, 0, 160, 30)];
    _itemSearch.barStyle = UIBarStyleDefault;
    _itemSearch.delegate = self;
    _itemSearch.userInteractionEnabled = TRUE;
    for (UIView* view in _itemSearch.subviews) {
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

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self updateDisplayItemsByText:searchText];
}

- (void) updateDisplayItemsByText: (NSString*) searchText
{
    [_dumpItems removeAllObjects];
    if (searchText == nil || [searchText compare:@""]==NSOrderedSame)
        [_dumpItems addObjectsFromArray:_items];
    else {
        for (NSString* item in _items) {
            if ([item rangeOfString:searchText].location != NSNotFound)
                [_dumpItems addObject:item];
        }
    }
    [_itemPicker reloadAllComponents];
    [_tmpObj reloadAllComponents];
}

- (IBAction) showAddNewItem: (id) sender
{
    UIAlertView* input = [[UIAlertView alloc] initWithTitle:@"请输入：" message:@"请输入：" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    input.alertViewStyle = UIAlertViewStylePlainTextInput;
    [input show];
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            NSLog(@"Cancel Clicked");
            break;
        case 1:
        {
            UITextField* text = [alertView textFieldAtIndex:0];
            [_items addObject:text.text];
            [_dumpItems addObject:text.text];
            [_itemPicker reloadAllComponents];
            NSLog(@"Input text:%@", text.text);
            break;
        }
        default:
            break;
    }
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_dumpItems count];
}
- (NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_dumpItems objectAtIndex:row];
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _selectedRow = row;
}


- (BOOL) searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void) searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    _isEditSearchBar = YES;
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    UIPickerView* pick = _tmpObj;
    [pick removeFromSuperview];
    _isEditSearchBar = NO;  // resignFirstResponder 方法会导致keyboardWillShowNo...方法再次被调用，因此，该条件变量设置一定要放在前面
    [searchBar resignFirstResponder];
    [_itemPicker reloadAllComponents];
}


- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    _isEditSearchBar = NO;
    [self updateDisplayItemsByText:nil];
    [searchBar setText:@""];
    [searchBar resignFirstResponder];
    [_tmpObj removeFromSuperview];
    [_itemPicker reloadAllComponents];
}

- (IBAction)itemOKClick:(id)sender
{
    NSString* item;
    if ([_dumpItems count] == 0) return;
    item = [_dumpItems objectAtIndex:_selectedRow];
    [_tmpObj removeFromSuperview];
    _isEditSearchBar = NO;
    [_itemSearch resignFirstResponder];
    [_delegate performSelector:_setAction withObject:item];
}

- (IBAction)itemFinishClick:(id)sender
{
    [_delegate performSelector:_finishAction withObject:nil];
}

- (void) pickerTap: (UIGestureRecognizer*) ges
{
    [self itemOKClick:nil];
}

- (id) init:(UITextField *)textField :(SEL)setItemAction :(SEL) finishAction :(id)delegate :(NSArray *)strItems
{
    self = [super init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
    textField.inputView = [self getItemPicker];
    textField.inputAccessoryView = [self getToolbarWithSearchbarAndInput];
    _okBtn.title = @"完成";
    [_okBtn setTarget:self];
    [_okBtn setAction:@selector(itemFinishClick:)];
    _delegate = delegate;
    _setAction = setItemAction;
    _finishAction = finishAction;
    _items = [strItems mutableCopy];
    _dumpItems = [[NSMutableArray alloc] initWithArray:_items];
    UITapGestureRecognizer* tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickerTap:)];
    [_itemPicker addGestureRecognizer:tapGes];
    return self;
}

@end
