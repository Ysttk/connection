//
//  CHomeMember.m
//  Connection
//
//  Created by 寿宝江 on 13-12-13.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "CHomeMember.h"
#import "Connection.h"

static const NSString* roleKey = @"role";
static const NSString* nameKey = @"name";
static const NSString* birKey = @"birthday";

@implementation CHomeMember


- (id) init
{
    if (self = [super init]) {
        _role = _name =  nil;
        _birthday = nil;
    }
    return self;
}

- (NSString*) toString
{
    NSMutableString* tmpStr = [[NSMutableString alloc] init];
    [tmpStr appendString: _role];
    [tmpStr appendString:@"~"];
    [tmpStr appendString:_name];
    [tmpStr appendFormat:@"    %@", [Utils getDateString:_birthday]];
    return tmpStr;
}

- (NSDictionary*) toDictionary
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDictionary* dic = [[NSDictionary alloc] initWithObjectsAndKeys: [formatter stringFromDate:_birthday], birKey, _role, roleKey, _name, nameKey, nil];
    return dic;
}

- (BOOL) fromDictionary:(NSDictionary *)dic
{
    NSDateFormatter* formater = [[NSDateFormatter alloc]init];
    [formater setDateFormat:@"yyyy-MM-dd"];
    _role = [dic valueForKey:roleKey];
    _name = [dic valueForKey:nameKey];
    _birthday = [formater dateFromString:[dic valueForKey:birKey]];
    return TRUE;
}

@end
