//
//  DatingRecord.h
//  Connection
//
//  Created by 寿宝江 on 13-12-22.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DatingRecord : NSManagedObject

@property (nonatomic, retain) NSString * attendee;
@property (nonatomic, retain) NSString * data_type;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * evaluate_score;
@property (nonatomic, retain) NSString * note;
@property (nonatomic, retain) NSString * perpare;
@property (nonatomic, retain) NSString * place;
@property (nonatomic, retain) NSString * purpose;
@property (nonatomic, retain) NSNumber * quality;

@end
