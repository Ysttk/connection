//
//  MultiSelectStrPickerWithSearchHelper.h
//  Connection
//
//  Created by 寿宝江 on 14-2-7.
//  Copyright (c) 2014年 Org. All rights reserved.
//

#import "UIHelperBase.h"

@interface MultiSelectStrPickerWithSearchHelper : UIHelperBase <UIToolbarDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UISearchBarDelegate>

@property (nonatomic, retain) id delegate;
@property (nonatomic, assign) SEL setAction;
@property (nonatomic, assign) SEL finishAction;

@property (nonatomic, retain) UIToolbar* pickerToolBar;
@property (nonatomic, retain) UIBarButtonItem* okBtn;
@property (nonatomic, retain) UIPickerView* itemPicker;
@property (nonatomic, retain) NSMutableArray* items;
@property (nonatomic, retain) NSMutableArray* dumpItems;
@property (nonatomic, retain) UISearchBar* itemSearch;
@property (nonatomic, assign) NSInteger selectedRow;
@property (nonatomic, retain) UIPickerView* tmpObj;
@property (nonatomic, assign) bool isEditSearchBar;

- (id) init:(UITextField *)textField :(SEL)setItemAction :(SEL) finishAction :(id)delegate :(NSArray *)strItems;
@end
