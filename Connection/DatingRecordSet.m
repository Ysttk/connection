//
//  DatingRecordSet.m
//  Connection
//
//  Created by 寿宝江 on 13-12-20.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "DatingRecordSet.h"

@implementation DatingRecordSet


- (NSString*) toString
{
    NSMutableString* tmpStr = [[NSMutableString alloc] init];
    for (id record in _datingRecords) {
        [tmpStr appendFormat:@"%@\n", [record toString]];
    }
    return tmpStr;
}

@end
