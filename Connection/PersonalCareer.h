//
//  PersonalCareer.h
//  Connection
//
//  Created by 寿宝江 on 13-12-22.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PersonalBasicInfo;

@interface PersonalCareer : NSManagedObject

@property (nonatomic, retain) NSString * career;
@property (nonatomic, retain) NSString * company;
@property (nonatomic, retain) NSString * goal;
@property (nonatomic, retain) NSString * history;
@property (nonatomic, retain) NSString * position;
@property (nonatomic, retain) NSString * profession;
@property (nonatomic, retain) NSString * skills;
@property (nonatomic, retain) PersonalBasicInfo *my_basic_info;

@end
