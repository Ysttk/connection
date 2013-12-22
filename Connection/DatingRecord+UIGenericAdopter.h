//
//  DatingRecord+UIGenericAdopter.h
//  Connection
//
//  Created by 寿宝江 on 13-12-20.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "DatingRecord.h"
#import "Connection.h"

@interface DatingRecord (UIGenericAdopter)

+ (id) alloc;

- (id) init;

- (NSString*) toString;
- (bool) IsRelateToCurrent;

@property (nonatomic, retain) NSString* currentName;

@end
