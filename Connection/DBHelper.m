//
//  DBHelper.m
//  Connection
//
//  Created by 寿宝江 on 13-12-14.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "DBHelper.h"

@implementation DBHelper

+ (NSManagedObjectContext*) getContext
{
    AppDelegate* delegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* context = [delegate managedObjectContext];
    return context;
}

@end
