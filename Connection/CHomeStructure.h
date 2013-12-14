//
//  CHomeStructure.h
//  Connection
//
//  Created by 寿宝江 on 13-12-13.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSerialize.h"

@interface CHomeStructure : NSObject <PSerialize>

@property (nonatomic, copy) NSMutableArray* members;

@end
