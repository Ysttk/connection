//
//  PersonalInfo.h
//  Connection
//
//  Created by 寿宝江 on 13-10-4.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalBasicInfoView : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *m_Name;
@property (weak, nonatomic) IBOutlet UITextField *m_Mobile;
@property (weak, nonatomic) IBOutlet UITextField *m_City;
@property (weak, nonatomic) IBOutlet UITextField *m_Birthday;
@property (weak, nonatomic) IBOutlet UITextField *m_Age;

@end
