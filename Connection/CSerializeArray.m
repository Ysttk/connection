//
//  CSerializeArray.m
//  Connection
//
//  Created by 寿宝江 on 13-10-27.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "CSerializeArray.h"
#import "PFieldIterate.h"

@implementation CSerializeArray

- (NSString*) SaveToString: (id) fieldIterator
{
    NSMutableString* str = [[NSMutableString alloc] init];
    id nextV = [fieldIterator GetNextField];
    while (nextV != nil) {
        if ([nextV isKindOfClass: [NSNumber class]]) {
            [str appendString: @"i"];
            [str appendString:[nextV stringValue]];
        } else if ([nextV isKindOfClass:[NSDate class]]) {
            [str appendString:@"D"];
            [str appendString:[nextV description]];
        } else if ([nextV isKindOfClass:[NSString class]]) {
            [str appendString:@"S"];
            [str appendString:nextV];
        }
        [str appendString:@","];
        nextV = [fieldIterator GetNextField];
    }

    return nil;
}

- (NSNumber*) GetNumberFromStringSeg: (NSString*) strSeg
{
    NSString* valueSeg = [strSeg substringFromIndex:1];
    NSNumber* value = [NSNumber numberWithInteger:[valueSeg integerValue]];
    return value;
}

- (NSDate*) GetDateFromStringSeg: (NSString*) strSeg
{
    NSString* valueSeg = [strSeg substringFromIndex:1];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* date = [formatter dateFromString:valueSeg];
    return date;
}

- (NSString*) GetStringFromStringSeg: (NSString*) strSeg
{
    NSString* valueSeg = [strSeg substringFromIndex:1];
    return valueSeg;
}

- (void) LoadFromString: (NSString*) content : (id) fieldIterator
{
    NSArray* strSegSet = [content componentsSeparatedByString:@","];
    int length = [strSegSet count];
    for (int i=0; i<length; i++) {
        NSString* strSeg = [strSegSet objectAtIndex:i];
        if ([strSeg characterAtIndex:0] == 'i')
            [fieldIterator SetNextField: [self GetNumberFromStringSeg:strSeg]];
        else if ([strSeg characterAtIndex:0] =='D')
            [fieldIterator SetNextField: [self GetDateFromStringSeg:strSeg]];
        else if ([strSeg characterAtIndex:0] == 'S')
            [fieldIterator SetNextField: [self GetStringFromStringSeg:strSeg]];
    }
}
@end
