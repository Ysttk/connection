//
//  CEducationItem.h
//  Connection
//
//  Created by 寿宝江 on 13-12-12.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "libs.h"
#import "PSerialize.h"

@interface CEducationItem : NSObject <PSerialize>
@property (nonatomic, retain) NSDate* from;
@property (nonatomic, retain) NSDate* to;
@property (nonatomic, retain) NSString* school;

- (NSString*) toString;
@end
