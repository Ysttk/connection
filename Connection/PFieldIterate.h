//
//  PFieldIterate.h
//  Connection
//
//  Created by 寿宝江 on 13-10-27.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PFieldIterate <NSObject>
- (id) GetNextField;
- (BOOL) SetNextField: (id) value;

@end
