//
//  PersonalBasicInfoView2.h
//  Connection
//
//  Created by 寿宝江 on 13-12-15.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connection.h"
#import "PersonalBasicInfo.h"
#import "CGenericItemSetView.h"
#import "CHomeMember.h"

@interface PersonalBasicInfoView2 : UITableViewController
@property (weak, nonatomic) IBOutlet UITextView *m_HomeIntro;
@property (weak, nonatomic) IBOutlet UITextField *m_HomeRole;
@property (weak, nonatomic) IBOutlet UITextField *m_HomeName;
@property (weak, nonatomic) IBOutlet UITextField *m_HomeBirthday;
@property (weak, nonatomic) IBOutlet UIButton *m_HomeAddBtn;
@property (weak, nonatomic) IBOutlet UITextField *m_Interest;
@property (weak, nonatomic) IBOutlet UITextView *m_Habit;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *m_StatusBtn;

@property (nonatomic, retain) PersonalBasicInfo* basicInfo;
@property (nonatomic, assign) bool isEditModel;

@end
