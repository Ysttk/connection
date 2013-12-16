//
//  CGenericItemSetView.h
//  Connection
//
//  Created by 寿宝江 on 13-12-16.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGenericItemSetView : UITableViewController

@property (nonatomic, retain) NSMutableArray* items;

@property (nonatomic, assign) Class item_class;

- (void) setItems:(NSMutableArray *)items;
@end
