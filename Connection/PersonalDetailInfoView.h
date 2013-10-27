//
//  PersonalDetailInfoView.h
//  Connection
//
//  Created by 寿宝江 on 13-10-4.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalDetailInfoView : UITableViewController
    <UIPickerViewDelegate,
    UIPickerViewDataSource,
    UIToolbarDelegate>


@property (weak, nonatomic) IBOutlet UITextField *lovingSport;
@property (weak, nonatomic) IBOutlet UITextField *lovingDrink;

@property (weak, nonatomic) IBOutlet UITextField *lovingSmork;

@property (weak, nonatomic) IBOutlet UITextField *lovingPlace;
@property (nonatomic) UIPickerView* picker;
@property (nonatomic) UIToolbar* pickerToolbar;

@end
