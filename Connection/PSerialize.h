//
//  PSerialize.h
//  Connection
//
//  Created by 寿宝江 on 13-12-13.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PSerialize <NSObject>

- (NSString*) serialize;
- (BOOL) deserialize: (NSString*) jsonStr;
- (NSDictionary*) toDictionary;
- (BOOL) fromDictionary: (NSDictionary*) dic;
@end
