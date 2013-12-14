//
//  PersonalInfo.h
//  Connection
//
//  Created by 寿宝江 on 13-10-4.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalBasicInfo.h"

@interface PersonalBasicInfoView : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *m_StatusActionButton;
@property (weak, nonatomic) IBOutlet UITextField *m_Name;
@property (weak, nonatomic) IBOutlet UITextField *m_Age;
@property (weak, nonatomic) IBOutlet UITextField *m_EnglishName;
@property (weak, nonatomic) IBOutlet UITextField *m_Phone;

@property (weak, nonatomic) IBOutlet UITextField *m_Email;
@property (weak, nonatomic) IBOutlet UILabel *m_PhoneLbl;
@property (weak, nonatomic) IBOutlet UILabel *m_EmailLbl;
@property (weak, nonatomic) IBOutlet UITextField *m_Birthday;
@property (weak, nonatomic) IBOutlet UITextView *m_EducationBackgroud;
@property (weak, nonatomic) IBOutlet UITableViewCell *m_ConnectionCell;

@property (nonatomic, assign) bool isEditMode;

@property (nonatomic, retain) PersonalBasicInfo* basicInfo;
@end
