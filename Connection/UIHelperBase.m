//
//  UIHelperBase.m
//  Connection
//
//  Created by 寿宝江 on 14-2-6.
//  Copyright (c) 2014年 Org. All rights reserved.
//

#import "UIHelperBase.h"

@implementation UIHelperBase

static NSMutableArray* helpers;

+ (UIHelperBase*) registUIHelper: (UIHelperBase*) helper
{
    if (helpers == nil) {
        helpers = [[NSMutableArray alloc] init];
    }
    [helpers addObject:helper];
    return helper;
}

+ (void) releaseUIHelper
{
    for (UIHelperBase* helper in helpers) {
        [[NSNotificationCenter defaultCenter] removeObserver:helper];
    }
    [helpers removeAllObjects];
}
@end
