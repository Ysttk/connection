//
//  PersonalDatingSessions.h
//  Connection
//
//  Created by 寿宝江 on 13-10-27.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AllDatingRecord, PersonalBasicInfo;

@interface PersonalDatingSessions : NSManagedObject

@property (nonatomic, retain) NSNumber * session_id;
@property (nonatomic, retain) NSSet *activities;
@property (nonatomic, retain) PersonalBasicInfo *my_basic_info;
@end

@interface PersonalDatingSessions (CoreDataGeneratedAccessors)

- (void)addActivitiesObject:(AllDatingRecord *)value;
- (void)removeActivitiesObject:(AllDatingRecord *)value;
- (void)addActivities:(NSSet *)values;
- (void)removeActivities:(NSSet *)values;

@end
