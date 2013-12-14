//
//  CHomeStructure.m
//  Connection
//
//  Created by 寿宝江 on 13-12-13.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "CHomeStructure.h"
#import "CHomeMember.h"
#import "JsonHelper.h"

@implementation CHomeStructure

- (id) init
{
    if (self = [super init]) {
        _members = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString*) serialize
{
    NSString* re = [JsonHelper JsonFromSerializeArray:_members];
    return re;
}

- (BOOL) deserialize:(NSString *)jsonStr
{
    NSArray* dicArray = [JsonHelper ArrayFromJsonString:jsonStr];
    _members = [[NSMutableArray alloc] init];
    for (NSDictionary* dic in dicArray) {
        CHomeMember* member = [[CHomeMember alloc] init];
        [member fromDictionary:dic];
        [_members addObject:member];
    }
    return TRUE;
}

@end
