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

NSString* CareerTypeC[] = {
    @"作为主业", @"作为副业", nil
};
int CareerTypeN;

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

NSString* InterestC[] = {
    @"喜欢的活动",
    @"电脑/网络",
    @"电子游戏",
    @"与朋友喝酒",
    @"品茗",
    @"看电影/电视",
    @"听音乐",
    @"乐器演奏",
    @"烹调",
    @"摄影",
    @"下棋/打牌",
    @"观光旅游",
    @"逛街购物",
    @"阅读",
    @"写作",
    @"舞会/卡拉OK",
    @"各种收集活动",
    @"理财/投资",
    @"文艺表演",
    @"聊天",
    @"家务/手工艺",
    @"书法/绘画",
    @"其他",
    @"喜欢的体育运动",
    @"足球",
    @"排球",
    @"篮球",
    @"骑单车/摩托车",
    @"乒乓球",
    @"保龄球",
    @"健身/跑步",
    @"钓鱼",
    @"游泳/冲浪/潜水",
    @"网球",
    @"羽毛球",
    @"高尔夫",
    @"滑冰/滑雪",
    @"其他",
    @"喜欢的音乐",
    @"中文流行音乐",
    @"轻音乐",
    @"民族音乐",
    @"老歌",
    @"舞曲",
    @"歌剧",
    @"西部乡村",
    @"英文流行音乐",
    @"交响乐",
    @"地方戏曲",
    @"摇滚",
    @"另类",
    @"灵歌",
    @"爵士/蓝调",
    @"其他",
    @"喜欢的影视节目",
    @"故事片",
    @"文艺爱情",
    @"科幻",
    @"动作武侠",
    @"侦探推理",
    @"实验电影",
    @"老电影",
    @"限制级电影",
    @"儿童/卡通片",
    @"纪录片",
    @"西部电影",
    @"恐怖",
    @"得奖电影",
    @"艺术电影",
    @"音乐歌舞",
    @"肥皂剧",
    @"喜剧",
    @"其他",
    @"什么都看",
    @"喜欢的食物",
    @"川菜",
    @"江浙菜",
    @"湘菜",
    @"火锅",
    @"烧烤",
    @"家常菜",
    @"路边摊",
    @"健康食品",
    @"零食",
    @"粤菜",
    @"北方菜",
    @"面食",
    @"素食",
    @"甜食",
    @"自助餐",
    @"减肥餐",
    @"能填饱肚子就好",
    @"其他",
    @"喜欢的地方",
    @"都市",
    @"村庄",
    @"小镇",
    @"山区",
    @"办公室/学校",
    @"游乐场",
    @"购物中心",
    @"我家/我的房间",
    @"海滨",
    @"岛屿",
    @"沙漠",
    @"雪野",
    @"图书馆/书店",
    @"展览馆",
    @"宗教圣地",
    @"古迹",
    @"森林",
    @"公园",
    @"咖啡厅/酒吧",
    @"动物园",
    @"夜市赶集",
    @"各种俱乐部",
    @"其他",
    @"喜欢的宠物",
    @"狗",
    @"猫",
    @"鱼",
    @"兔",
    @"鸟",
    @"乌龟",
    @"蜥蜴",
    @"鼠",
    @"蛇",
    @"另类宠物",
    nil,
};
int InterestN;

NSArray* InterestTbl;
int InterestTblDepth;
NSString* InterestTblTitleKey = @"key";
NSString* InterestTblDataKey = @"data";
NSString* _InterestTbl =
@"[\
    {\"key\":\"喜欢的运动\", \"data\":\
        [\"网球\",\
        \"篮球\"],\
    },\
    {\"key\":\"喜欢去的地方\", \"data\":\
        [\"杭州\",\
        \"北京\"],\
    },\
]";

NSString* ClassKey = @"class";
NSString* InitKey = @"init_func:";
NSString* PersistKey = @"persist_func:";
NSString* SaveFuncKey = @"save_func:";
NSString* EditRowHeigh = @"row_heigh";
NSString* EditRowId = @"row_id";
NSString* DisplayRowId = @"disp_row_id";
NSString* DisplayRowHeigh = @"disp_row_heigh";

NSString* HomeKey = @"HomeMembers";
NSString* InterestKey = @"Interests";
NSString* EducationKey = @"EducationItems";
NSString* ExperienceKey = @"ExperienceItems";
NSString* CareerKey = @"CareerFields";
NSString* SkillKey= @"SkillItems";
NSString* DatingKey = @"DatingRecord";

NSString* _SetId2SetViewCellIdAndEditViewId =
@"{\
\"HomeMembers\":{\"class\":\"CHomeMember\",\"save_func:\":\"SaveHomeMember:\", \"disp_row_id\":\"GenericItemDisp\", \"disp_row_heigh\":44, \"init_func:\":\"home_init:\", \"persist_func:\":\"home_persist:\", \"row_heigh\":76, \"row_id\":\"EditHomeMember\"}, \
\"Interests\":{\"class\":\"CInterest\",\"save_func:\":\"SaveInterest:\",\"disp_row_id\":\"GenericItemDisp\",\"disp_row_heigh\":44, \"init_func:\":\"interest_init:\", \"persist_func:\":\"interest_persist:\", \"row_heigh\":44, \"row_id\":\"EditInterest\"},\
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
    InterestTbl = [[CJSONDeserializer deserializer] deserializeAsArray:[_InterestTbl dataUsingEncoding:NSUTF8StringEncoding] error:&_tmpError];
    InterestTblDepth = 2;
    
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
    count = 0;
    while (InterestC[count] != nil) count++;
    InterestN = count;
    count =0;
    while (CareerTypeC[count] != nil) count++;
    CareerTypeN = count;
}