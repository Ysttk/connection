//
//  UIHelper.h
//  Connection
//
//  Created by 寿宝江 on 13-12-16.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIHelper : NSObject <UIToolbarDelegate>

@property (nonatomic, retain) id delegate;
@property (nonatomic, assign) SEL setDateAction;


- (void) setDatePickerForTextField: (UITextField*) textField :(SEL)setDateAction :(id) delegate;

+ (UIHelper*) getUIHelper;
+ (void) releaseUIHelper;
@end
