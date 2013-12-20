//
//  DatingRecord+UIGenericAdopter.m
//  Connection
//
//  Created by 寿宝江 on 13-12-20.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "DatingRecord+UIGenericAdopter.h"

@implementation DatingRecord (UIGenericAdopter)

+ (id) alloc
{
    NSLog(@"special alloc called");
    return nil;
}

- (NSString*) toString
{
    return nil;
}

@end
