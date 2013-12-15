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
@property (weak, nonatomic) IBOutlet UIBarButtonItem *m_AddBtn;


@end
