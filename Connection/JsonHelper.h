//
//  JsonHelper.h
//  Connection
//
//  Created by 寿宝江 on 13-12-14.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonHelper : NSObject

+(NSString*) JsonFromSerializeArray: (NSMutableArray*) array;

+(NSArray*) ArrayFromJsonString: (NSString*) jsonStr;
@end

#import "libs.h"
#import "PSerialize.h"

@implementation JsonHelper

+(NSString*) JsonFromSerializeArray:(NSMutableArray*)array
{
    NSMutableArray* tmpArray = [[NSMutableArray alloc] init];
    for (id dic in array) {
        [tmpArray addObject:[dic toDictionary]];
    }
    NSError* error;
    NSData* jsonData = [[CJSONSerializer serializer] serializeArray:tmpArray error:&error];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+(NSArray*) ArrayFromJsonString:(NSString *)jsonStr
{
    NSError* error;
    NSData* jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSArray* array = [[CJSONDeserializer deserializer] deserializeAsArray:jsonData error:&error];
    return array;
}
@end
