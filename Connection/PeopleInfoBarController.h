//
//  PeopleInfoBarController.h
//  Connection
//
//  Created by 寿宝江 on 13-12-14.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connection.h"
#import "PersonalBasicInfo.h"

@interface PeopleInfoBarController : UITabBarController <UITabBarControllerDelegate>
@property (nonatomic, retain) PersonalBasicInfo* peopleBasicInfo;
@property (nonatomic, retain) id currentController;
- (void) registCurrentSubViewController: (UIViewController*) controller;
@end
