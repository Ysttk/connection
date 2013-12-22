//
//  Header.h
//  Connection
//
//  Created by 寿宝江 on 13-12-12.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (int) getAgeFromBirthday: (NSDate*) birthday
{
    if (birthday == nil) return 0;
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSCalendarUnit unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDate* now = [NSDate date];
    NSDateComponents* comp = [calendar components:unitFlags fromDate:now];
    int year = [comp year];
    
    comp = [calendar components:unitFlags fromDate:birthday];
    int oldyear = [comp year];
    
    return (year - oldyear);
}
+ (DateInterval*) getDateIntervalUntilNow: (NSDate*) from
{
    return [self getDateInterval:from :nil];
}

+ (DateInterval*) getDateIntervalSinceNow: (NSDate*) to
{
    return [self getDateInterval:nil :to];
}

+ (DateInterval*) getDateInterval: (NSDate*) from :(NSDate*) to
{
    if (from == nil) from = [NSDate date];
    if (to == nil) to = [NSDate date];
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSCalendarUnit unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents* fromComp = [calendar components:unitFlags fromDate:from];
    NSDateComponents* toComp = [calendar components:unitFlags fromDate:to];
    int year = toComp.year - fromComp.year;
    int month = toComp.month - fromComp.month;
    int day = toComp.day - fromComp.day;
    if (month < 0) {
        year --;
        month += 12;
    }
    if (day < 0) {
        month -- ;
        day += 30;
    }
    if (! (year>0 || month>0 || day>0))
        year = month = day =0;
    DateInterval* re = [[DateInterval alloc] initWithYMD:year :month :day];
    return re;
}

+ (NSString*) getDateString:(NSDate *)date
{
    if (date == nil) return @"";
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [[NSString alloc] initWithString:[formatter stringFromDate:date]];
}

+ (NSDate*) getDateFromString:(NSString *)dateStr
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter dateFromString:dateStr];
}

@end