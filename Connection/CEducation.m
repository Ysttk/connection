//
//  CEducation.m
//  Connection
//
//  Created by 寿宝江 on 13-12-5.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "CEducation.h"
#import "CEducationItem.h"
#import "Connection.h"

@implementation CEducation

- (id) init
{
    if (self = [super init]) {
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString*) serialize
{
    NSString* str= [JsonHelper JsonFromSerializeArray: _items];
    return str;
}

- (BOOL) deserialize: (NSString*) content
{
    NSArray* dicArray = [JsonHelper ArrayFromJsonString:content];
    _items = [[NSMutableArray alloc] init];
    for (NSDictionary* dic in dicArray) {
        CEducationItem* item = [[CEducationItem alloc] init];
        [item fromDictionary:dic];
        [_items addObject:item];
    }
    
    return TRUE;
}



@end
