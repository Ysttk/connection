//
//  DatingRecord.h
//  Connection
//
//  Created by 寿宝江 on 13-12-20.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DatingRecord : NSManagedObject

@property (nonatomic, retain) NSString * attendee;
@property (nonatomic, retain) NSString * data_type;
@property (nonatomic, retain) NSDate * end_time;
@property (nonatomic, retain) NSNumber * evaluate_score;
@property (nonatomic, retain) NSString * note;
@property (nonatomic, retain) NSString * perpare;
@property (nonatomic, retain) NSString * purpose;
@property (nonatomic, retain) NSNumber * quality;
@property (nonatomic, retain) NSDate * start_time;

@end
