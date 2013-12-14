//
//  CExperience.m
//  Connection
//
//  Created by 寿宝江 on 13-12-13.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "CExperience.h"
#import "CExperienceItem.h"
#import "Connection.h"

@implementation CExperience

- (id) init
{
    if (self = [super init]) {
        _items = [[NSMutableArray alloc]init];
    }
    
    return self;
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
        CExperienceItem* item = [[CExperienceItem alloc] init];
        [item fromDictionary:dic];
        [_items addObject:item];
    }
    
    return TRUE;
}

@end
