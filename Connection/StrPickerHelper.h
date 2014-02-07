//
//  StrPickerHelper.h
//  Connection
//
//  Created by 寿宝江 on 14-2-6.
//  Copyright (c) 2014年 Org. All rights reserved.
//

#import "UIHelperBase.h"

@interface StrPickerHelper : UIHelperBase <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, retain) id delegate;
@property (nonatomic, retain) UIPickerView* itemPicker;
@property (nonatomic, retain) NSMutableArray* items;

@property (nonatomic, retain) UIToolbar* pickerToolBar;
@property (nonatomic, retain) UIBarButtonItem* okBtn;
@property (nonatomic, assign) NSInteger selectedRow;

@property (nonatomic, assign) SEL setAction;


- (id) init:(UITextField *)textField :(SEL)setItemAction :(id)delegate :(NSArray*) strItems;
@end
