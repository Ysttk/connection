//
//  CSkill.h
//  Connection
//
//  Created by 寿宝江 on 13-12-13.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "libs.h"
#import "PSerialize.h"

@interface CSkill : NSObject <PSerialize>

@property (nonatomic, copy) NSString* skill;
@property (nonatomic, copy) NSString* level;

@end
