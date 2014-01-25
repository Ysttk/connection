//
//  CInterest.h
//  Connection
//
//  Created by 寿宝江 on 14-1-25.
//  Copyright (c) 2014年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSerialize.h"
@interface CInterest : NSObject <PSerialize>

@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* type;

- (NSString*) toString;


@end
