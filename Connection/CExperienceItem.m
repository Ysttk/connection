//
//  CExperienceItem.m
//  Connection
//
//  Created by 寿宝江 on 13-12-13.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "CExperienceItem.h"

static const NSString* fromKey = @"from";
static const NSString* toKey = @"to";
static const NSString* descKey = @"desc";

@implementation CExperienceItem

- (id) init
{
    if (self = [super init]) {
    }
    return self;
}

- (NSDictionary*) toDictionary
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDictionary* dic = [[NSDictionary alloc] initWithObjectsAndKeys: [formatter stringFromDate:_from], fromKey, [formatter stringFromDate:_to], toKey, _description, descKey, nil];
    return dic;
}

- (BOOL) fromDictionary:(NSDictionary *)dic
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    _from = [formatter dateFromString:[dic valueForKey:fromKey]];
    _to = [formatter dateFromString:[dic valueForKey:toKey]];
    _description = [dic valueForKey:descKey];
    return TRUE;
}

@end
