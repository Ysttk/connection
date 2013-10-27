//
//  PersonalBasicInfo.h
//  Connection
//
//  Created by 寿宝江 on 13-10-27.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PersonalDatingSessions, PersonalDetails;

@interface PersonalBasicInfo : NSManagedObject

@property (nonatomic, retain) NSDate * birthday;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * is_male;
@property (nonatomic, retain) NSString * education;
@property (nonatomic, retain) NSString * home_member;
@property (nonatomic, retain) NSString * intresters;
@property (nonatomic, retain) NSString * habit;
@property (nonatomic, retain) NSString * source;
@property (nonatomic, retain) NSString * buddy_type;
@property (nonatomic, retain) NSString * buddy_closer_type;
@property (nonatomic, retain) NSSet *my_dating_record;
@property (nonatomic, retain) PersonalDetails *my_details;
@property (nonatomic, retain) NSManagedObject *my_first_met_record;
@end

@interface PersonalBasicInfo (CoreDataGeneratedAccessors)

- (void)addMy_dating_recordObject:(PersonalDatingSessions *)value;
- (void)removeMy_dating_recordObject:(PersonalDatingSessions *)value;
- (void)addMy_dating_record:(NSSet *)values;
- (void)removeMy_dating_record:(NSSet *)values;

@end
