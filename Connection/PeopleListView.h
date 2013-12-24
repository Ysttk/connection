//
//  PeopleListView.h
//  Connection
//
//  Created by 寿宝江 on 13-10-28.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeopleListView : UITableViewController
{
}


@property (nonatomic, retain) NSMutableArray* personalInfoArray;

@property (nonatomic, retain) NSMutableArray* dispPersonalInfoArray;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *m_AddBtn;

@property (weak, nonatomic) IBOutlet UITextField *m_BuddyType;
@property (weak, nonatomic) IBOutlet UITextField *m_BuddyCloseType;
@property (weak, nonatomic) IBOutlet UITextField *m_Field;
@property (weak, nonatomic) IBOutlet UITextField *m_Tag;

@property (nonatomic, retain) NSString* buddyType;
@property (nonatomic, retain) NSString* buddyCloseType;

@end
