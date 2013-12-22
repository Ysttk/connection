//
//  PersonalActivityView.h
//  Connection
//
//  Created by 寿宝江 on 13-10-4.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connection.h"
#import "PersonalBasicInfo.h"
#import "DatingRecord+UIGenericAdopter.h"
#import "PersonalFirstTimeRecord.h"
#import "Constant.h"

@interface PersonalActivityView : UITableViewController

@property (nonatomic, retain) PersonalBasicInfo* basicInfo;
@property (nonatomic, retain) NSMutableArray* datingRecords;
@property (nonatomic, assign) bool isEditMode;

@property (weak, nonatomic) IBOutlet UITextField *m_FirstDateTime;
@property (weak, nonatomic) IBOutlet UITextField *m_FirstDateInterval;
@property (weak, nonatomic) IBOutlet UITextField *m_Introducer;
@property (weak, nonatomic) IBOutlet UITextField *m_FirstDatePlace;
@property (weak, nonatomic) IBOutlet UITextField *m_FirstDatePurpose;
@property (weak, nonatomic) IBOutlet UITextField *m_RelationShip;
@property (weak, nonatomic) IBOutlet UITextView *m_DatingRecords;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *m_StatusBtn;
@property (weak, nonatomic) IBOutlet UITableViewCell *m_RecordCell;
@end
