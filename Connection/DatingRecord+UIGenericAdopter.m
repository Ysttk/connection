//
//  DatingRecord+UIGenericAdopter.m
//  Connection
//
//  Created by 寿宝江 on 13-12-20.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "DatingRecord+UIGenericAdopter.h"
#import <objc/runtime.h>

@implementation DatingRecord (UIGenericAdopter)
static const void *CurrentNameKey = "CurrentNameKey";
@dynamic currentName;

- (NSString*) currentName
{
    return objc_getAssociatedObject(self, CurrentNameKey);
}

- (void) setCurrentName:(NSString *)currentName
{
    objc_setAssociatedObject(self, CurrentNameKey, currentName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

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
    NSMutableString* att = [[NSMutableString alloc] init];
    NSArray* array = [self.attendee componentsSeparatedByString:
                      @":"];
    [att appendString:[array objectAtIndex:0]];
    for (int i=1; i<[array count]; i++) {
        NSString* name = [array objectAtIndex:i];
        if ([name compare:self.currentName] != NSOrderedSame)
            [att appendFormat:@":%@", name];
    }
    
    return [[NSString alloc] initWithFormat:@"%@ 在%@\n谈%@\n参与的人：%@",    [Utils getDateString: self.date], self.place, self.purpose, att];
}

- (bool) IsRelateToCurrent
{
    return ([self.attendee rangeOfString:self.currentName].location != NSNotFound);
}


@end
