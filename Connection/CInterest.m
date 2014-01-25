//
//  CInterest.m
//  Connection
//
//  Created by 寿宝江 on 14-1-25.
//  Copyright (c) 2014年 Org. All rights reserved.
//

#import "CInterest.h"

static NSString* typeKey = @"type";
static NSString* nameKey = @"name";

@implementation CInterest

- (NSString*) toString
{
    NSMutableString* tmp = [[NSMutableString alloc] init];
    [tmp appendFormat:@"%@：%@", _type, _name];
    return tmp;
}

- (BOOL) fromDictionary: (NSDictionary*) dic
{
    _name = [dic valueForKey:nameKey];
    _type = [dic valueForKey:typeKey];
    return YES;
}

- (NSDictionary*) toDictionary
{
    NSDictionary* dic = [[NSDictionary alloc] initWithObjectsAndKeys:_type, typeKey, _name, nameKey, nil];
    return dic;
}

@end
