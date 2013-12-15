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
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSCalendarUnit unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDate* now = [NSDate date];
    NSDateComponents* comp = [calendar components:unitFlags fromDate:now];
    int year = [comp year];
    
    comp = [calendar components:unitFlags fromDate:birthday];
    int oldyear = [comp year];
    
    return (year - oldyear);
}

+ (NSString*) getDateString:(NSDate *)date
{
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