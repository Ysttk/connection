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
    DatingRecord* record = [NSEntityDescription insertNewObjectForEntityForName:@"DatingRecord" inManagedObjectContext:[DBHelper getContext]];
    
    return record;
}

- (id) init
{
    return self;
}

- (NSString*) toString
{
    return [[NSString alloc] initWithFormat:@"%@ 在%@\n谈%@\n参与的人：%@",    [Utils getDateString: self.date], self.place, self.purpose, self.attendee];
}

@end
