//
//  PersonalDetailInfoView.h
//  Connection
//
//  Created by 寿宝江 on 13-10-4.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connection.h"
#import "PersonalBasicInfo.h"

@interface PersonalCareer : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *m_Object;
@property (weak, nonatomic) IBOutlet UITextField *m_Skill;
@property (weak, nonatomic) IBOutlet UITextField *m_Company;
@property (weak, nonatomic) IBOutlet UITextField *m_Position;
@property (weak, nonatomic) IBOutlet UITextView *m_Experience;
@property (weak, nonatomic) IBOutlet UITextView *m_Career;

@property (nonatomic, assign) bool isEditMode;

@property (nonatomic, retain) PersonalBasicInfo* basicInfo;
@end
