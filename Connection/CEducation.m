//
//  CEducation.m
//  Connection
//
//  Created by 寿宝江 on 13-12-5.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "CEducation.h"
#import "Connection.h"

@implementation CEducation

- (id) init
{
    if (self = [super init]) {
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addEducationItem: (CEducationItem*) item
{
    [_items addObject:item];
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

- (NSString*) toString
{
    NSMutableString* str = [[NSMutableString alloc] init];
    for (CEducationItem* item in _items) {
        [str appendString:[item toString]];
        [str appendString:@"\n"];
    }
    return str;
}



@end
