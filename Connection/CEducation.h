//
//  CEducation.h
//  Connection
//
//  Created by 寿宝江 on 13-12-5.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSerialize.h"

@interface CEducation : NSObject <PSerialize>
@property (nonatomic, retain) NSMutableArray* items;

- (NSString*) toString;

@end
