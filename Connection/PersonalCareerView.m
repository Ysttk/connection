//
//  PersonalDetailInfoView.m
//  Connection
//
//  Created by 寿宝江 on 13-10-4.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "PersonalCareerView.h"
#import "PersonalBasicInfo.h"
#import "CGenericItemSetView.h"
#import "CExperience.h"
#import "CSkillSet.h"
#import "CCareer.h"
#import "PersonalCareer.h"

@interface PersonalCareerView ()


@end

@implementation PersonalCareerView

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UIBarPosition) positionForBar:(id<UIBarPositioning>)bar
{
    return UIBarPositionTop;
}
- (IBAction)BackClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = true;
    [super viewWillAppear:animated];
    [self updateCareer];
    [self updateEditMode];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _isEditMode = false;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

}

- (void) updateEditMode
{
    BOOL enable;
    if (_isEditMode) {
        [_m_StatusBtn setTitle:@"完成"];
        _m_SkillCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        _m_CareerCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        _m_ExperienceCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        enable = TRUE;
    } else {
        [_m_StatusBtn setTitle:@"编辑"];
        _m_SkillCell.accessoryType = UITableViewCellAccessoryNone;
        _m_CareerCell.accessoryType = UITableViewCellAccessoryNone;
        _m_ExperienceCell.accessoryType =UITableViewCellAccessoryNone;
        enable = FALSE;
    }
    _m_Object.enabled = enable;
    _m_Company.enabled = enable;
    _m_Position.enabled =enable;
    
    _m_Object.delegate = self;
    _m_Company.delegate = _m_Position.delegate = self;
}

- (void) updateCareer
{
    if (_basicInfo.my_details == nil)
        _basicInfo.my_details = [NSEntityDescription insertNewObjectForEntityForName:@"PersonalCareer" inManagedObjectContext:[DBHelper getContext]];
    
    [_m_Object setText:_basicInfo.my_details.goal];
    [_m_Company setText:_basicInfo.my_details.company];
    [_m_Position setText:_basicInfo.my_details.position];
    
    CCareer* career = [[CCareer alloc] init];
    [career deserialize:_basicInfo.my_details.career];
    _m_Career.text = [career toString];
    CSkillSet* set = [[CSkillSet alloc] init];
    [set deserialize:_basicInfo.my_details.skills];
    _m_Skill.text = [set toString];
    CExperience* exps = [[CExperience alloc] init];
    [exps deserialize:_basicInfo.my_details.history];
    _m_Experience.text = [exps toString];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setPersonalBasicInfo: (PersonalBasicInfo*) basicInfo
{
    _basicInfo = basicInfo;
}

- (PersonalBasicInfo*) getPersonalBasicInfo
{
    return _basicInfo;
}
- (IBAction)SwitchEditMode:(id)sender {
    if (_isEditMode) {
        _basicInfo.my_details.goal = _m_Object.text;
        _basicInfo.my_details.company = _m_Company.text;
        _basicInfo.my_details.position = _m_Position.text;
        [DBHelper SaveAll];
    }
    _isEditMode = !_isEditMode;
    [self updateEditMode];
}

- (void) SaveCareer: (NSArray*) items
{
    CCareer* career = [[CCareer alloc] init];
    career.fields = [items mutableCopy];
    _basicInfo.my_details.career = [career serialize];
    [DBHelper SaveAll];
}

- (void) SaveExperience: (NSArray*) items
{
    CExperience* exp = [[CExperience alloc] init];
    exp.items = [items mutableCopy];
    _basicInfo.my_details.history = [exp serialize];
    [DBHelper SaveAll];
}

- (void) SaveSkill: (NSArray*) items
{
    CSkillSet* set = [[CSkillSet alloc] init];
    set.skills = [items mutableCopy];
    _basicInfo.my_details.skills = [set serialize];
    [DBHelper SaveAll];
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] compare: @"EditExperience"] == NSOrderedSame) {
        CGenericItemSetView* dest = [segue destinationViewController];
        dest.item_key = ExperienceKey;
        dest.parent = self;
        CExperience* exp = [[CExperience alloc]init];
        [exp deserialize:_basicInfo.my_details.history];
        dest.items = exp.items;
    } else if ([[segue identifier] compare:@"EditCareer"] == NSOrderedSame) {
        CGenericItemSetView* dest = [segue destinationViewController];
        dest.parent = self;
        dest.item_key = CareerKey;
        CCareer* career = [[CCareer alloc] init];
        [career deserialize:_basicInfo.my_details.career];
        dest.items = career.fields;
    } else if ([[segue identifier] compare:@"EditSkill"] == NSOrderedSame) {
        CGenericItemSetView* dest = [segue destinationViewController];
        dest.parent = self;
        dest.item_key = SkillKey;
        CSkillSet* skills = [[CSkillSet alloc] init];
        [skills deserialize:_basicInfo.my_details.skills];
        dest.items = skills.skills;
    }
}

- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if (_isEditMode)
        return TRUE;
    else
        return FALSE;
}


@end
