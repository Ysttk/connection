//
//  UIHelper.h
//  Connection
//
//  Created by 寿宝江 on 13-12-16.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIHelper : NSObject <UIToolbarDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UISearchBarDelegate>

@property (nonatomic, retain) id delegate;
@property (nonatomic, assign) SEL setAction;

//for multi selector
@property (nonatomic, assign) SEL finishAction;

@property (nonatomic, retain) UIToolbar* pickerToolBar;
@property (nonatomic, retain) UIBarButtonItem* okBtn;

//for date picker
@property (nonatomic, retain) UIDatePicker* datePicker;

//for item picker
@property (nonatomic, retain) UIPickerView* itemPicker;
@property (nonatomic, retain) NSArray* items;
//for item picker with search bar
@property (nonatomic, retain) NSMutableArray* dumpItems;
@property (nonatomic, retain) UISearchBar* itemSearch;
@property (nonatomic, assign) bool isEditSearchBar;
@property (nonatomic, assign) bool isWithSearchFunc;
@property (nonatomic, retain) UIPickerView* tmpObj;

@property (nonatomic, assign) NSInteger selectedRow;

- (void) setDatePickerForTextField: (UITextField*) textField :(SEL)setDateAction :(id) delegate;
- (void) setStrPickerForTextField: (UITextField*) textField :(SEL) setItemAction :(id) delegate :(NSArray*) array;
- (void) setStrPickerWithSearchForTextField:(UITextField *)textField :(SEL)setItemAction :(id)delegate :(NSArray *)strItems;
- (void) setMultiSelectStrPickerWithSearchForTextField:(UITextField *)textField :(SEL)setItemAction :(SEL) finishAction :(id)delegate :(NSArray *)strItems;

+ (UIHelper*) getUIHelper;
+ (void) releaseUIHelper;
@end
