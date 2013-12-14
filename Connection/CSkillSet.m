//
//  CSkillSet.m
//  Connection
//
//  Created by 寿宝江 on 13-12-13.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "CSkillSet.h"
#import "CSkill.h"
#import "Connection.h"

@implementation CSkillSet

- (id) init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (NSString*) serialize
{
    NSString* re = [JsonHelper JsonFromSerializeArray:_skills];
    return re;
}

- (BOOL) deserialize:(NSString *)jsonStr
{
    NSArray* dicArray = [JsonHelper ArrayFromJsonString:jsonStr];
    _skills = [[NSMutableArray alloc] init];
    for (NSDictionary* dic in dicArray) {
        CSkill* skill = [[CSkill alloc] init];
        [skill fromDictionary:dic];
        [_skills addObject:skill];
    }
    
    return TRUE;
}

@end
