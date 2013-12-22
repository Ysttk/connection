//
//  PersonalFirstTimeRecord.h
//  Connection
//
//  Created by 寿宝江 on 13-12-21.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PersonalBasicInfo;

@interface PersonalFirstTimeRecord : NSManagedObject

@property (nonatomic, retain) NSDate * first_met_time;
@property (nonatomic, retain) NSString * introducer;
@property (nonatomic, retain) NSString * met_place;
@property (nonatomic, retain) NSString * met_reason;
@property (nonatomic, retain) NSString * relationship;
@property (nonatomic, retain) PersonalBasicInfo *my_basic_info;

@end
