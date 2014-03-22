//
//  MultiColumnStrPickerWithSearchAndInput.h
//  Connection
//
//  Created by 寿宝江 on 14-2-9.
//  Copyright (c) 2014年 Org. All rights reserved.
//

#import "UIHelperBase.h"

@interface MultiColumnStrPicker : UIHelperBase <UIPickerViewDataSource, UIPickerViewDelegate, UISearchBarDelegate>
@property (nonatomic, retain) id delegate;
@property (nonatomic, assign) SEL setAction;

//for multi selector
@property (nonatomic, assign) SEL finishAction;

@property (nonatomic, retain) UIToolbar* pickerToolBar;
@property (nonatomic, retain) UIBarButtonItem* okBtn;

@property (nonatomic, retain) UIPickerView* itemPicker;
@property (nonatomic, retain) NSMutableArray* items;
//for item picker with search bar
@property (nonatomic, retain) NSMutableArray* selectedItems;
@property (nonatomic, assign) NSInteger totalComponts;


@property (nonatomic, retain) NSMutableArray* selectedRows;



- (id) init:(UITextField *)textField :(SEL)setItemAction :(id)delegate :(NSArray *)strItems :(int)depth;
@end
