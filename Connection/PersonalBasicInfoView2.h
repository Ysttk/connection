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

@interface PersonalBasicInfoView2 : UITableViewController <UITextFieldDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *m_HomeIntro;
@property (weak, nonatomic) IBOutlet UITextField *m_Interest;
@property (weak, nonatomic) IBOutlet UITextView *m_Habit;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *m_StatusBtn;
@property (weak, nonatomic) IBOutlet UITableViewCell *m_HomeCell;
@property (weak, nonatomic) IBOutlet UITextView *m_InterestNote;

@property (nonatomic, retain) PersonalBasicInfo* basicInfo;
@property (nonatomic, assign) bool isEditModel;

- (void) SaveHomeMember:(NSArray*)members;

@end
