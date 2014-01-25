//
//  CInterestSet.h
//  Connection
//
//  Created by 寿宝江 on 14-1-25.
//  Copyright (c) 2014年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CInterest.h"

@interface CInterestSet : NSObject

@property (nonatomic, retain) NSMutableArray* items;

- (NSString*) toUIString;
- (NSString*) serialize;
- (BOOL) deserialize:(NSString *)jsonStr;

@end
