//
//  PersonalBasicInfoView2.m
//  Connection
//
//  Created by 寿宝江 on 13-12-15.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "PersonalBasicInfoView2.h"
#import "CHomeStructure.h"
#import "CHomeMember.h"
#import "Connection.h"

@interface PersonalBasicInfoView2 ()

@end

@implementation PersonalBasicInfoView2

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        _isEditModel = false;
    }
    return self;
}

- (void) setPersonalBasicInfo: (PersonalBasicInfo*) basicInfo
{
    _basicInfo = basicInfo;
}

- (PersonalBasicInfo*) getPersonalBasicInfo
{
    return _basicInfo;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void) reloadPersonalBasicInfo
{
    if (_basicInfo == nil) return;
    CHomeStructure* home = [[CHomeStructure alloc] init];
    [home deserialize:_basicInfo.home_member];
    [_m_HomeIntro setText:[home toString]];
    
    CInterestSet* interests = [[CInterestSet alloc] init];
    [interests deserialize:_basicInfo.intresters];
    [_m_Interest setText:[interests toUIString]];
    
    [_m_Habit setText:_basicInfo.habit];
}

- (void) UpdateByEditModel
{
    [_m_HomeIntro setEditable:FALSE];
    [_m_Interest setEditable:FALSE];
    BOOL enable;
    if (_isEditModel) {
        [_m_StatusBtn setTitle:@"完成"];
        _m_HomeCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        enable = TRUE;
    } else {
        [_m_StatusBtn setTitle:@"编辑"];
        _m_HomeCell.accessoryType = UITableViewCellAccessoryNone;
        enable = FALSE;
    }
    
//    _m_Interest.enabled = enable;
    _m_Habit.editable = enable;
//    _m_InterestNote.editable = enable;
    
    _m_Habit.delegate = self;
}

- (void) SaveHomeMember:(NSArray *)members
{
    CHomeStructure* home = [[CHomeStructure alloc]init];
    [home deserialize:_basicInfo.home_member];
    home.members = [members mutableCopy];
    _basicInfo.home_member = [home serialize];
    [DBHelper SaveAll];
}

- (void) SaveInterest:(NSArray*) interests
{
    CInterestSet* items = [[CInterestSet alloc] init];
    items.items = [interests mutableCopy];
    _basicInfo.intresters = [items serialize];
    [DBHelper SaveAll];
}


- (IBAction)SwitchEditModel:(id)sender {
    if (_isEditModel) {
        //_basicInfo.intresters = _m_Interest.text;
        _basicInfo.habit = _m_Habit.text;
        [DBHelper SaveAll];
    }
    _isEditModel = ! _isEditModel;
    [self UpdateByEditModel];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    _isEditModel = false;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
//
//- (void) addInterest: (NSString*) interest
//{
//    NSString* current = self.m_Interest.text;
//    NSArray* items = [current componentsSeparatedByString:@";"];
//    bool first = true;
//    bool exist = false;
//    NSMutableString* new = [[NSMutableString alloc] init];
//    for (NSString* item in items) {
//        if ([item compare:@""] == NSOrderedSame) continue;
//        if ([item compare:interest] != NSOrderedSame) {
//            if (first) {
//                [new appendString:item];
//                first = false;
//            } else
//                [new appendFormat:@";%@", item];
//        } else
//            exist = true;
//    }
//    if (!exist) {
//        if (first)
//            [new appendString:interest];
//        else
//            [new appendFormat:@";%@", interest];
//    }
//    self.m_Interest.text = new;
//}

//- (void) finishInterest: (NSString*) item
//{
//    _basicInfo.intresters = _m_Interest.text;
//    [DBHelper SaveAll];
//    [_m_Interest resignFirstResponder];
//}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    [self reloadPersonalBasicInfo];
    [self UpdateByEditModel];
    
//    UIHelper* helper = [UIHelper getUIHelper];
//    NSArray* array = [[NSArray alloc] initWithObjects:InterestC count:InterestN];
//    [helper setMultiSelectStrPickerWithSearchForTextField:self.m_Interest :@selector(addInterest:) :@selector(finishInterest:) :self :array];
}



- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UIHelper releaseUIHelper];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)SwitchEditMode:(id)sender {
    if (_isEditModel) {
        _basicInfo.habit = _m_Habit.text;
        [DBHelper SaveAll];
    }
    _isEditModel = !_isEditModel;
    [self UpdateByEditModel];
}

- (IBAction)BackClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    _basicInfo.habit = _m_Habit.text;
    //_basicInfo.intrester_note = _m_InterestNote.text;
    [DBHelper SaveAll];
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UIViewController* dest = [segue destinationViewController];
    if ([dest isKindOfClass:[CGenericItemSetView class]] ) {
        if ([[segue identifier] compare:@"HomeMemberEdit"] == NSOrderedSame ||
            [[segue identifier] compare:@"InterestEdit"] == NSOrderedSame) {
            CGenericItemSetView* destView = (CGenericItemSetView*) dest;
            NSString* key;
            if ([[segue identifier] compare:@"HomeMemberEdit"] == NSOrderedSame) {
                key = HomeKey;
                CHomeStructure* home = [[CHomeStructure alloc] init];
                [home deserialize:_basicInfo.home_member];
                destView.items = home.members;
            } else if ([[segue identifier] compare:@"InterestEdit"] == NSOrderedSame) {
                key = InterestKey;
                CInterestSet* items = [[CInterestSet alloc] init];
                [items deserialize:_basicInfo.intresters];
                destView.items = items.items;
            }
            NSDictionary* dic = (NSDictionary*) [SetId2SetViewCellIdAndEditViewId valueForKey:key];
            NSString* className = (NSString*) [dic valueForKey:ClassKey];
            destView.item_class = NSClassFromString(className);
            destView.item_key = key;

            destView.parent = self;
        }
    }
}

- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if (!_isEditModel)
        return NO;
    else
        return YES;
}



@end
