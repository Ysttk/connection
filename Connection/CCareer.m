//
//  CCareer.m
//  Connection
//
//  Created by 寿宝江 on 13-12-13.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "CCareer.h"
#import "CCareerField.h"
#import "JsonHelper.h"

@implementation CCareer

- (id) init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (NSString*) serialize
{
    
    NSString* re = [JsonHelper JsonFromSerializeArray:_fields];
    return re;
}

- (BOOL) deserialize:(NSString *)jsonStr
{
    NSArray* dicArray = [JsonHelper ArrayFromJsonString:jsonStr];
    _fields = [[NSMutableArray alloc] init];
    for (NSDictionary* dic in dicArray) {
        CCareerField* field = [[CCareerField alloc] init];
        [field fromDictionary:dic];
        [_fields addObject:field];
    }
    return TRUE;
}

@end
