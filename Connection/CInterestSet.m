//
//  CInterestSet.m
//  Connection
//
//  Created by 寿宝江 on 14-1-25.
//  Copyright (c) 2014年 Org. All rights reserved.
//

#import "CInterestSet.h"
#import "Connection.h"
#import "PSerialize.h"

@implementation CInterestSet

- (NSString*) toUIString
{
    NSMutableString* str = [[NSMutableString alloc]init];
    NSMutableDictionary* cluster = [[NSMutableDictionary alloc] init];
    for (CInterest* item in _items) {
        if ([cluster valueForKey:item.type] == nil)
            [cluster setObject:[[NSMutableArray alloc]init] forKey:item.type];
        NSMutableArray* array = [cluster valueForKey:item.type];
        [array addObject:item];
    }
    NSEnumerator* keys = [cluster keyEnumerator];
    for (NSString* key in keys) {
        NSMutableArray* names = [cluster valueForKey:key];
        if ([names count] > 0) {
            CInterest* item = [names objectAtIndex:0];
            [str appendFormat:@"%@：%@", key, item.name];
            [names removeObjectAtIndex:0];
        }
        for (CInterest* item in names) {
            [str appendFormat:@"、%@", item.name];
        }
        [str appendString:@"\n"];
    }
    return str;
}

- (NSString*) toString
{
    NSMutableString* tmpStr = [[NSMutableString alloc]init];
    for (id item in _items) {
        [tmpStr appendString:[item toString]];
        [tmpStr appendString:@"\n"];
    }
    return tmpStr;
}

- (NSString*) serialize
{
    NSString* re = [JsonHelper JsonFromSerializeArray:_items];
    return re;
}

- (BOOL) deserialize:(NSString *)jsonStr
{
    NSArray* dicArray = [JsonHelper ArrayFromJsonString:jsonStr];
    _items = [[NSMutableArray alloc] init];
    for (NSDictionary* dic in dicArray) {
        CInterest* item = [[CInterest alloc] init];
        [item fromDictionary:dic];
        [_items addObject:item];
    }
    return TRUE;
}

@end
