//
//  CSkill.m
//  Connection
//
//  Created by 寿宝江 on 13-12-13.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "CSkill.h"

static const NSString* skillKey = @"skill";
static const NSString* levelKey = @"level";

@implementation CSkill

- (id) init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (NSDictionary*) toDictionary
{
    NSDictionary* dic = [[NSDictionary alloc] initWithObjectsAndKeys: _skill, skillKey, _level, levelKey, nil];
    return dic;
}

- (BOOL) fromDictionary:(NSDictionary *)dic
{
    _skill = [dic valueForKey:skillKey];
    _level = [dic valueForKey:levelKey];
    return TRUE;
}

- (NSString*) toString
{
    return [[NSString alloc] initWithFormat:@"%@~%@", _skill, _level];
}
@end
