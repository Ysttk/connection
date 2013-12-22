//
//  DateInterval.m
//  Connection
//
//  Created by 寿宝江 on 13-12-22.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "DateInterval.h"

@implementation DateInterval

- (id) initWithYMD: (int) year :(int) month :(int) day
{
    self = [super init];
    if (self) {
        _year = year; _month = month; _day = day;
    }
    return self;
}

- (NSString*) toString
{
    if (_year >0 )
        return [[NSString alloc] initWithFormat:@"%d年%d个月%d天", _year, _month, _day];
    else if (_month>0)
        return [[NSString alloc] initWithFormat:@"%d个月%d天",_month, _day];
    else
        return [[NSString alloc] initWithFormat:@"%d天", _day];
}

@end
