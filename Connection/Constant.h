//
//  Constant.h
//  Connection
//
//  Created by 寿宝江 on 13-12-14.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* HomeRoleC[];
extern int HomeRoleN;
extern NSString* SkillLevelC[];
extern int SkillLevelN;
extern NSString* BuddyTypeC[];
extern int BuddyTypeN;
extern NSString* BuddyCloseC[];
extern int BuddyCloseN;
extern NSString* SexC[];
extern int SexN;
extern NSString* CityC[];
extern int CityN;
extern NSString* InterestC[];
extern int InterestN;
extern NSArray* InterestTbl;
extern int InterestTblDepth;
extern NSString* InterestTblTitleKey;
extern NSString* InterestTblDataKey;

extern NSDictionary* SetId2SetViewCellIdAndEditViewId;
extern NSString* ClassKey;
extern NSString* InitKey;
extern NSString* PersistKey;
extern NSString* EditRowHeigh;
extern NSString* EditRowId;
extern NSString* SaveFuncKey;
extern NSString* DisplayRowId;
extern NSString* DisplayRowHeigh;

extern NSString* HomeKey;
extern NSString* InterestKey;
extern NSString* EducationKey;
extern NSString* ExperienceKey;
extern NSString* CareerKey;
extern NSString* SkillKey;
extern NSString* DatingKey;


void InitGlobalConstant();
