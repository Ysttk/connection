//
//  Constant.m
//  Connection
//
//  Created by 寿宝江 on 13-12-14.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "Constant.h"
#import "CJSONDeserializer.h"

NSString* HomeRoleC[] = {
    @"妻子", @"丈夫", @"儿子", @"爸爸", @"妈妈", @"祖父", @"祖母",
};

NSString* SkillLevelC[] = {
    @"专家", @"精通", @"普通",
};

NSString* BuddyTypeC[] = {
    @"同学", @"战友", @"工作", @"生活", @"亲戚",
};

NSString* ClassKey = @"class";
NSString* InitKey = @"init_func:";
NSString* PersistKey = @"persist_func:";
NSString* SaveFuncKey = @"save_func:";
NSString* EditRowHeigh = @"row_heigh";
NSString* EditRowId = @"row_id";


NSString* HomeKey = @"HomeMembers";

NSString* _SetId2SetViewCellIdAndEditViewId =
@"{\
\"HomeMembers\":{\"class\":\"CHomeMember\",\"save_func:\":\"SaveHomeMember:\", \"init_func:\":\"home_init:\", \"persist_func:\":\"home_persist:\", \"row_heigh\":76, \"row_id\":\"EditHomeMember\"}, \
}";

NSDictionary* SetId2SetViewCellIdAndEditViewId;

void InitGlobalConstant ()
{
    NSError* _tmpError;
    SetId2SetViewCellIdAndEditViewId = [[CJSONDeserializer deserializer] deserialize:[_SetId2SetViewCellIdAndEditViewId dataUsingEncoding:NSUTF8StringEncoding] error:&_tmpError];
}