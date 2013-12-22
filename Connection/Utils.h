//
//  Header.h
//  Connection
//
//  Created by 寿宝江 on 13-12-12.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#ifndef Connection_Utils_h
#define Connection_Utils_h

#import <Foundation/Foundation.h>

#import "JsonHelper.h"
#import "DBHelper.h"
#import "DateInterval.h"

@interface Utils : NSObject

+ (int) getAgeFromBirthday: (NSDate*) birthday;
+ (NSString*) getDateString: (NSDate*) date;
+ (NSDate*) getDateFromString: (NSString*) dateStr;
+ (DateInterval*) getDateIntervalSinceNow: (NSDate*) to;
+ (DateInterval*) getDateIntervalUntilNow: (NSDate*) to;
+ (DateInterval*) getDateInterval: (NSDate*) from :(NSDate*) to;
@end

#endif
