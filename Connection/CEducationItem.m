//
//  CEducationItem.m
//  Connection
//
//  Created by 寿宝江 on 13-12-12.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "CEducationItem.h"
#import "Utils.h"

@implementation CEducationItem

- (id) init
{
    if (self = [super init]) {

    }
    return self;
}

- (NSString*) serialize
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys: [formatter stringFromDate:_from], @"from", [formatter stringFromDate:_to], @"to", _school, @"school", nil];
    NSError* error;
    NSData* jsonData = [[CJSONSerializer serializer] serializeObject:dic error:&error];
    NSString* jsonStr = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonStr;
}

- (BOOL) deserialize: (NSString*) content
{
    NSData* jsonData = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSError* error;
    NSDictionary* dic = [[CJSONDeserializer deserializer] deserializeAsDictionary:jsonData error:&error];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    _from = [formatter dateFromString:[dic valueForKey:@"from"]];
    _to = [formatter dateFromString:[dic valueForKey:@"to"]];
    _school = [dic valueForKey:@"school"];
    return TRUE;
}

- (NSDictionary*) toDictionary
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [NSDictionary dictionaryWithObjectsAndKeys: [formatter stringFromDate:_from], @"from", [formatter stringFromDate:_to], @"to", _school, @"school", nil];
}

- (BOOL) fromDictionary:(NSDictionary *)dic
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    _from = [formatter dateFromString:[dic valueForKey:@"from"]];
    _to = [formatter dateFromString:[dic valueForKey:@"to"]];
    _school = [dic valueForKey:@"school"];
    return TRUE;
}

- (NSString*) toString
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSMutableString* str = [[NSMutableString alloc] init];
    [str appendString:[formatter stringFromDate:_from]];
    [str appendString:@"到"];
    [str appendString:[formatter stringFromDate:_to]];
    [str appendString:@"    "];
    [str appendString:_school];
    return str;
}
@end
