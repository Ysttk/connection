//
//  CSkillSet.h
//  Connection
//
//  Created by 寿宝江 on 13-12-13.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "libs.h"
#import "PSerialize.h"

@interface CSkillSet : NSObject <PSerialize>

@property (nonatomic, copy) NSMutableArray* skills;

@end
