//
//  UIHelper.h
//  Connection
//
//  Created by 寿宝江 on 13-12-16.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIHelperBase.h"
#import "DatePickerHelper.h"
#import "StrPickerHelper.h"
#import "StrPickerWithSearchHelper.h"
#import "MultiSelectStrPickerWithSearchHelper.h"
#import "MultiSelectStrPickerWithSearch_InputHelper.h"
#import "MultiColumnStrPicker.h"


@interface UIHelper : NSObject <UIToolbarDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UISearchBarDelegate, UIAlertViewDelegate>

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
@property (nonatomic, retain) NSMutableArray* items;
//for item picker with search bar
@property (nonatomic, retain) NSMutableArray* dumpItems;
@property (nonatomic, retain) UISearchBar* itemSearch;
@property (nonatomic, assign) bool isEditSearchBar;
@property (nonatomic, assign) bool isWithSearchFunc;
@property (nonatomic, retain) UIPickerView* tmpObj;

@property (nonatomic, assign) NSInteger selectedRow;

//for item picker with multiple columns
@property (nonatomic, assign) BOOL isMultiColumn;
@property (nonatomic, assign) int depth;
@property (nonatomic, retain) NSDictionary* dictionary;

- (void) setDatePickerForTextField: (UITextField*) textField :(SEL)setDateAction :(id) delegate;
- (void) setStrPickerForTextField: (UITextField*) textField :(SEL) setItemAction :(id) delegate :(NSArray*) array;
- (void) setStrPickerWithSearchForTextField:(UITextField *)textField :(SEL)setItemAction :(id)delegate :(NSArray *)strItems;
- (void) setMultiSelectStrPickerWithSearchForTextField:(UITextField *)textField :(SEL)setItemAction :(SEL) finishAction :(id)delegate :(NSArray *)strItems;
- (void) setMultiSelectStrPickerWithSearchAndInputForTextField:(UITextField *)textField :(SEL)setItemAction :(SEL) finishAction :(id)delegate :(NSArray *)strItems;

//will be support in next release
- (void) setMultiColumnMSStrPickerWithSAIForTextField:(UITextField*) textField :(SEL) setItemAction :(SEL) finishAction :(id) delegate :(NSDictionary*) itemDic :(int) depth;
//will be support in next release
- (void) setMultiColumnSSStrPickerWithSAIForTextField: (UITextField*) textField :(SEL) selectAction :(id) delegate :(NSDictionary*) itemDic :(int) depth;

+ (UIHelper*) getUIHelper;
+ (void) releaseUIHelper;
@end
