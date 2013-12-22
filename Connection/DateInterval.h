//
//  DateInterval.h
//  Connection
//
//  Created by 寿宝江 on 13-12-22.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateInterval : NSObject

@property (nonatomic, assign) int year;
@property (nonatomic, assign) int month;
@property (nonatomic, assign) int day;

- (id) initWithYMD: (int) year :(int) month :(int) day;
- (NSString*) toString;

@end
