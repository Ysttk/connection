//
//  CCareerField.m
//  Connection
//
//  Created by 寿宝江 on 13-12-13.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "CCareerField.h"

static const NSString* fieldKey = @"field";
static const NSString* roleKey = @"role";

@implementation CCareerField

- (id) init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (NSDictionary*) toDictionary
{
    NSDictionary* dic = [[NSDictionary alloc] initWithObjectsAndKeys:_field, fieldKey, _role, roleKey, nil];
    return dic;
}

- (BOOL) fromDictionary:(NSDictionary *)dic
{
    _field = [dic valueForKey:fieldKey];
    _role = [dic valueForKey:roleKey];
    return TRUE;
}
- (NSString*) toString
{
    return [[NSString alloc] initWithFormat:@"%@~%@", _field, _role];
}
@end
