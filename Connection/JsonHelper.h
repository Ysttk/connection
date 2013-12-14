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
