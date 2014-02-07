//
//  UIHelperBase.h
//  Connection
//
//  Created by 寿宝江 on 14-2-6.
//  Copyright (c) 2014年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIHelperBase : NSObject
+ (UIHelperBase*) registUIHelper: (UIHelperBase*) helper;
+ (void) releaseUIHelper;
@end
