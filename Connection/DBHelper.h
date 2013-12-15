//
//  DBHelper.h
//  Connection
//
//  Created by 寿宝江 on 13-12-14.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface DBHelper : NSObject

+ (NSManagedObjectContext*) getContext;
+ (BOOL) SaveAll;

@end
