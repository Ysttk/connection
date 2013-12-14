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

@interface Utils : NSObject

+ (int) getAgeFromBirthday: (NSDate*) birthday;
+ (NSString*) getDateString: (NSDate*) date;
@end

#endif
