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
    @"妻子", @"丈夫", @"儿子", @"爸爸", @"妈妈", @"祖父", @"祖母", nil
};
int HomeRoleN;

NSString* SkillLevelC[] = {
    @"专家", @"精通", @"普通", nil
};
int SkillLevelN;

NSString* BuddyTypeC[] = {
    @"同学", @"战友", @"工作", @"生活", @"亲戚", nil
};
int BuddyTypeN;
NSString* BuddyCloseC[] = {
    @"一般", @"紧密", nil
};
int BuddyCloseN;

NSString* SexC[] = {
    @"男", @"女", nil
};
int SexN;

NSString* CityC[] = {
    @"杭州", @"绍兴", nil
};
int CityN;

NSString* ClassKey = @"class";
NSString* InitKey = @"init_func:";
NSString* PersistKey = @"persist_func:";
NSString* SaveFuncKey = @"save_func:";
NSString* EditRowHeigh = @"row_heigh";
NSString* EditRowId = @"row_id";
NSString* DisplayRowId = @"disp_row_id";
NSString* DisplayRowHeigh = @"disp_row_heigh";

NSString* HomeKey = @"HomeMembers";
NSString* EducationKey = @"EducationItems";
NSString* ExperienceKey = @"ExperienceItems";
NSString* CareerKey = @"CareerFields";
NSString* SkillKey= @"SkillItems";
NSString* DatingKey = @"DatingRecord";

NSString* _SetId2SetViewCellIdAndEditViewId =
@"{\
\"HomeMembers\":{\"class\":\"CHomeMember\",\"save_func:\":\"SaveHomeMember:\", \"disp_row_id\":\"GenericItemDisp\", \"disp_row_heigh\":44, \"init_func:\":\"home_init:\", \"persist_func:\":\"home_persist:\", \"row_heigh\":76, \"row_id\":\"EditHomeMember\"}, \
\"EducationItems\":{\"class\":\"CEducationItem\",\"save_func:\":\"SaveEducation:\", \"disp_row_id\":\"GenericItemDisp\",\"disp_row_heigh\":44, \"init_func:\":\"education_init:\", \"persist_func:\":\"education_persist:\", \"row_heigh\":82, \"row_id\":\"EditEducation\"}, \
\"ExperienceItems\":{\"class\":\"CExperienceItem\",\"save_func:\":\"SaveExperience:\", \"disp_row_id\":\"GenericItemDisp\",\"disp_row_heigh\":44, \"init_func:\":\"experience_init:\", \"persist_func:\":\"experience_persist:\", \"row_heigh\":81, \"row_id\":\"EditExperience\"}, \
\"CareerFields\":{\"class\":\"CCareerField\",\"save_func:\":\"SaveCareer:\", \"disp_row_id\":\"GenericItemDisp\",\"disp_row_heigh\":44, \"init_func:\":\"career_init:\", \"persist_func:\":\"career_persist:\", \"row_heigh\":51, \"row_id\":\"EditCareer\"}, \
\"SkillItems\":{\"class\":\"CSkill\",\"save_func:\":\"SaveSkill:\", \"disp_row_id\":\"GenericItemDisp\",\"disp_row_heigh\":44, \"init_func:\":\"skill_init:\", \"persist_func:\":\"skill_persist:\", \"row_heigh\":44, \"row_id\":\"EditSkill\"}, \
\"DatingRecord\":{\"class\":\"DatingRecord\",\"save_func:\":\"SaveDatingRecords:\", \"disp_row_id\":\"DatingItemDisp\",\"disp_row_heigh\":85, \"init_func:\":\"dating_init:\", \"persist_func:\":\"dating_persist:\", \"row_heigh\":205, \"row_id\":\"EditDating\"}, \
}";

NSDictionary* SetId2SetViewCellIdAndEditViewId;

void InitGlobalConstant ()
{
    NSError* _tmpError;
    SetId2SetViewCellIdAndEditViewId = [[CJSONDeserializer deserializer] deserialize:[_SetId2SetViewCellIdAndEditViewId dataUsingEncoding:NSUTF8StringEncoding] error:&_tmpError];
    
    int count = 0;
    while (HomeRoleC[count] != nil) count++;
    HomeRoleN = count;
    count = 0;
    while (SkillLevelC[count] != nil) count++;
    SkillLevelN = count;
    count = 0;
    while (BuddyTypeC[count] != nil) count++;
    BuddyTypeN = count;
    count=0;
    while (BuddyCloseC[count] != nil) count++;
    BuddyCloseN = count;
    count =0;
    while (SexC[count] != nil) count++;
    SexN = count;
    count = 0;
    while (CityC[count] != nil) count++;
    CityN = count;
}