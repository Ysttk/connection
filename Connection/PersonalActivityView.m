//
//  PersonalActivityView.m
//  Connection
//
//  Created by 寿宝江 on 13-10-4.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "PersonalActivityView.h"
#import "CGenericItemSetView.h"

@interface PersonalActivityView ()

@end

@implementation PersonalActivityView

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.isEditMode = false;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) setFirstMetDate: (NSDate*) date
{
    [_m_FirstDateTime setText:[Utils getDateString:date]];
    [_m_FirstDateTime resignFirstResponder];
    _basicInfo.my_first_met_record.first_met_time = date;
    [_m_FirstDateInterval setText:[[Utils getDateIntervalUntilNow: date] toString]];
    [DBHelper SaveAll];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updatePeopleActivity];
    [self updateEditMode];
    self.navigationController.navigationBar.hidden = true;
    UIHelperBase* baseHelper = [[DatePickerHelper alloc] init: _m_FirstDateTime :@selector(setFirstMetDate:) :self];
    [UIHelperBase registUIHelper:baseHelper];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UIHelperBase releaseUIHelper];
}

- (void) updateDatingRecordList
{
    NSManagedObjectContext* context = [DBHelper getContext];
    NSFetchRequest* fetchRequst = [[NSFetchRequest alloc] init];
    NSEntityDescription* descript = [NSEntityDescription entityForName:@"DatingRecord" inManagedObjectContext:context];
    [fetchRequst setEntity:descript];
    NSError* error;
    NSArray* array = [context executeFetchRequest:fetchRequst error:&error];
    self.datingRecords = [[NSMutableArray alloc] init];
    for (id item in array) {
        DatingRecord* r = item;
        r.currentName = _basicInfo.name;
        if ([r IsRelateToCurrent]) {
            [self.datingRecords addObject:item];
        }
    }
    
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

- (void) updateEditMode
{
    BOOL isEnable;
    if (_isEditMode) {
        [_m_StatusBtn setTitle:@"完成"];
        isEnable = TRUE;
        [_m_RecordCell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    } else {
        [_m_StatusBtn setTitle:@"编辑"];
        isEnable = FALSE;
        [_m_RecordCell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    _m_FirstDateTime.enabled = isEnable;
    _m_FirstDateInterval.enabled = FALSE;
    _m_Introducer.enabled = isEnable;
    _m_FirstDatePlace.enabled = isEnable;
    _m_FirstDatePurpose.enabled = isEnable;
    _m_RelationShip.enabled = isEnable;
    
    _m_FirstDatePurpose.delegate = self;
    _m_Introducer.delegate = self;
    _m_RelationShip.delegate = self;
    _m_FirstDatePlace.delegate = self;
}

- (IBAction)SwitchEditMode:(id)sender {
    if (_isEditMode) {
        [self SaveFirstMetRecord];
    }
    _isEditMode = ! _isEditMode;
    [self updateEditMode];
}

- (void) SaveFirstMetRecord
{
    _basicInfo.my_first_met_record.met_place = _m_FirstDatePlace.text;
    _basicInfo.my_first_met_record.met_reason = _m_FirstDatePurpose.text;
    _basicInfo.my_first_met_record.introducer = _m_Introducer.text;
    _basicInfo.my_first_met_record.relationship = _m_RelationShip.text;
    [DBHelper SaveAll];
}

- (void) updatePeopleActivity
{
    if (_basicInfo.my_first_met_record == nil) {
        _basicInfo.my_first_met_record = [NSEntityDescription insertNewObjectForEntityForName:@"PersonalFirstTimeRecord" inManagedObjectContext:[DBHelper getContext]];
    }
    [_m_FirstDateTime setText:[Utils getDateString:_basicInfo.my_first_met_record.first_met_time]];
    [_m_Introducer setText:_basicInfo.my_first_met_record.introducer];
    [_m_FirstDatePlace setText:_basicInfo.my_first_met_record.met_place];
    [_m_FirstDatePurpose setText:_basicInfo.my_first_met_record.met_reason];
    [_m_RelationShip setText:_basicInfo.my_first_met_record.relationship];
    [_m_FirstDateInterval setText:[[Utils getDateIntervalUntilNow: _basicInfo.my_first_met_record.first_met_time] toString]];
    [self updateDatingRecordList];
    int n = [_datingRecords count];
    NSMutableString* recordStr = [[NSMutableString alloc] init];
    for (int i=0; i<n; i++) {
        DatingRecord* r = [_datingRecords objectAtIndex:i];
        [recordStr appendFormat:@"%@\n", [r toString]];
    }
    [_m_DatingRecords setText:recordStr];
    [_m_DatingRecords setEditable:FALSE];
}


- (IBAction)BackClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) SaveDatingRecords:(NSArray*) items
{
    _datingRecords = [items mutableCopy];
    NSMutableArray* tmpStore = _datingRecords;
    [self updateDatingRecordList];
    for (DatingRecord* r in _datingRecords) {
        BOOL found = FALSE;
        for (DatingRecord* r2 in tmpStore)
            if (r2 == r) {
                found = TRUE; break;
            }
        if (found == FALSE) {
            [[DBHelper getContext] deleteObject:r];
        }
    }
    _datingRecords = tmpStore;
    [DBHelper SaveAll];
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    [self SaveFirstMetRecord];
    
    if ([[segue identifier] compare:@"EditDating"] == NSOrderedSame) {
        CGenericItemSetView* dest = [segue destinationViewController];
        dest.items = _datingRecords;
        dest.item_key = DatingKey;
        dest.parent = self;
        NSDictionary* dic = [[NSDictionary alloc] initWithObjectsAndKeys:_basicInfo.name, @"name", nil];
        dest.params = dic;
    }
}

- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier compare:@"EditDating"] == NSOrderedSame) {
        if (_isEditMode) return TRUE;
        else return FALSE;
    }
    return TRUE;
}
 

@end
