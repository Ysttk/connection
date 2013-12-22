//
//  PersonalBasicInfo.h
//  Connection
//
//  Created by 寿宝江 on 13-12-21.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PersonalDetails, PersonalFirstTimeRecord;

@interface PersonalBasicInfo : NSManagedObject

@property (nonatomic, retain) NSDate * birthday;
@property (nonatomic, retain) NSString * buddy_closer_type;
@property (nonatomic, retain) NSString * buddy_type;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * education;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * english_name;
@property (nonatomic, retain) NSString * habit;
@property (nonatomic, retain) NSString * home_member;
@property (nonatomic, retain) NSString * intresters;
@property (nonatomic, retain) NSNumber * is_male;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) PersonalDetails *my_details;
@property (nonatomic, retain) PersonalFirstTimeRecord *my_first_met_record;

@end
