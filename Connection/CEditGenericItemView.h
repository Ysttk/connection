//
//  CEditGenericItemView.h
//  Connection
//
//  Created by 寿宝江 on 13-12-16.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connection.h"

@interface CEditGenericItemView : UITableViewController

@property (nonatomic, assign) bool cancelClick;
@property (nonatomic,retain) id item;

@property (nonatomic, assign) SEL init_func;
@property (nonatomic, assign) SEL persist_func;
@property (nonatomic, assign) CGFloat rowHeigh;
@property (nonatomic, retain) NSString* item_key;

@property (nonatomic, retain) NSDictionary* params;

- (void) home_init: (UITableViewCell*) cell;
- (void) home_persist: (UITableViewCell*) cell;


- (void) setItem:(id) item;

@end
