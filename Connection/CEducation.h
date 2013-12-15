//
//  CEducation.h
//  Connection
//
//  Created by 寿宝江 on 13-12-5.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSerialize.h"
#import "CEducationItem.h"

@interface CEducation : NSObject <PSerialize>
@property (nonatomic, retain) NSMutableArray* items;

- (NSString*) toString;
- (void) addEducationItem: (CEducationItem*) item;
@end
