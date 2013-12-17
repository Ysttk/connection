//
//  CGenericItemSetView.h
//  Connection
//
//  Created by 寿宝江 on 13-12-16.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connection.h"

@interface CGenericItemSetView : UITableViewController

@property (nonatomic, retain) NSMutableArray* items;

@property (nonatomic, assign) Class item_class;

@property (nonatomic, retain) NSString* item_key;

- (void) setItems:(NSMutableArray *)items;
@end
