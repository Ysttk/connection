//
//  PersonalInfo.m
//  Connection
//
//  Created by 寿宝江 on 13-10-4.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "PersonalBasicInfoView.h"
#import "CEducation.h"
#import "CEducationItem.h"
#import "PeopleInfoBarController.h"
#import "CGenericItemSetView.h"


@interface PersonalBasicInfoView ()

@end



@implementation PersonalBasicInfoView

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }

    self.isEditMode = true;
    return self;
}

- (PersonalBasicInfo*) getPersonalBasicInfo
{
    return _basicInfo;
}

- (void) setPersonalBasicInfo: (PersonalBasicInfo*) basicInfo
{
    _basicInfo = basicInfo;
    [self reloadPeopleBasicInfo];
}

- (void) reloadPeopleBasicInfo
{
    [_m_Name setText:_basicInfo.name];
    int age = [Utils getAgeFromBirthday:_basicInfo.birthday];
    if (age>0) {
        [_m_Age setText:[NSString stringWithFormat:@"%d",age]];
    }
    [_m_EnglishName setText:_basicInfo.english_name];
    [_m_Phone setText:_basicInfo.phone];
    [_m_Email setText:_basicInfo.email];
    [_m_Birthday setText:[Utils getDateString:_basicInfo.birthday]];
    [_m_Phone setText:_basicInfo.phone];
    [_m_City setText:_basicInfo.city];
    NSString* sex;
    if ([_basicInfo.is_male isEqualToNumber:[NSNumber numberWithBool:YES]])
        sex = @"男";
    else
        sex = @"女";
    [_m_Sex setText:sex];
    [_m_BuddyType setText:_basicInfo.buddy_type];
    [_m_BuddyCloseType setText:_basicInfo.buddy_closer_type];
    
    //formate education information
    CEducation* education = [[CEducation alloc] init];
    [education deserialize:_basicInfo.education];
    [_m_EducationBackgroud setText:[education toString]];
}

- (void) showEmptyTextView: (UITextView*) textView :(bool) isShow
{
    return;
    if (([textView.text compare:@""] == NSOrderedSame) && ! isShow)
        textView.hidden = YES;
    else
        textView.hidden = NO;
    
}

- (void) showEmptyTextField: (UITextField*) textField :(bool) isShow
{
    return;
    if (([textField.text compare:@""] == NSOrderedSame) && !isShow)
        textField.hidden = YES;
    else
        textField.hidden = NO;
}

- (void) showEmptyTextFieldWithLabel: (UILabel*) label :(UITextField*) textField :(bool) isShow
{
    return;
    if (([textField.text compare:@""] == NSOrderedSame) && !isShow) {
        textField.hidden = YES;
        label.hidden = YES;
    } else {
        textField.hidden = NO;
        label.hidden = NO;
    }
}
- (IBAction)BackClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) UpdateStatusItem
{
    if (! _isEditMode) {
        [_m_StatusActionButton setTitle:@"编辑"];
        [_m_EducationCell setAccessoryType:UITableViewCellAccessoryNone];
    } else {
        [_m_StatusActionButton setTitle:@"完成"];
        [_m_EducationCell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void) UpdateEditMode
{

    bool isShowEmpty, isEditable;
    if (_isEditMode)
        isEditable = isShowEmpty = true;
    else
        isEditable = isShowEmpty = false;
    
    [_m_Name setEnabled:isEditable];
    [self showEmptyTextField:_m_Name :isShowEmpty];
    
    [_m_Age setEnabled:FALSE];
    [self showEmptyTextField:_m_Age :isShowEmpty];
    
    [_m_EnglishName setEnabled:isEditable];
    [self showEmptyTextField:_m_EnglishName :isShowEmpty];
    
    [_m_Phone setEnabled:isEditable];
    [self showEmptyTextFieldWithLabel:_m_PhoneLbl :_m_Phone :isShowEmpty];
    
    [_m_Email setEnabled:isEditable];
    [self showEmptyTextFieldWithLabel:_m_EmailLbl :_m_Email :isShowEmpty];
    
    [_m_Birthday setEnabled:isEditable];
    [self showEmptyTextField:_m_Birthday :isShowEmpty];
    
    [_m_EducationBackgroud setEditable:FALSE];
    [self showEmptyTextView:_m_EducationBackgroud :isShowEmpty];
    
    [_m_Sex setEnabled:isEditable];
    [_m_City setEnabled:isEditable];
    [_m_BuddyType setEnabled:isEditable];
    [_m_BuddyCloseType setEnabled:isEditable];
    
    
    [self UpdateStatusItem];
    

}

- (void) setCity: (NSString*) city
{
    _m_City.text = city;
    [_m_City resignFirstResponder];
    _basicInfo.city = city;
    [DBHelper SaveAll];
}

- (void) setBuddyType: (NSString*) type
{
    _m_BuddyType.text = type;
    [_m_BuddyType resignFirstResponder];
    _basicInfo.buddy_type = type;
    [DBHelper SaveAll];
}

- (void) setBuddyCloseType: (NSString*) type
{
    _m_BuddyCloseType.text = type;
    [_m_BuddyCloseType resignFirstResponder];
    _basicInfo.buddy_closer_type = type;
    [DBHelper SaveAll];
}

- (void) setSex: (NSString*) sex
{
    _m_Sex.text = sex;
    [_m_Sex resignFirstResponder];
    if ([sex compare:@"男"] == NSOrderedSame)
        _basicInfo.is_male = [NSNumber numberWithBool:YES];
    else
        _basicInfo.is_male = [NSNumber numberWithBool:NO];
    [DBHelper SaveAll];
}
- (IBAction)BeginEditBirthday:(id)sender {
    _currentEditor = _m_Birthday;
}



- (IBAction)setBirthday: (NSDate*) date
{
    [_currentEditor setText:[Utils getDateString:date]];
    [_currentEditor resignFirstResponder];
    _basicInfo.birthday = date;
    [DBHelper SaveAll];
}

- (UIBarPosition) positionForBar:(id<UIBarPositioning>)bar
{
    return UIBarPositionTop;
}



- (void)viewDidLoad
{

    [super viewDidLoad];
    
    
    
    id parent = [self parentViewController];
    [parent registCurrentSubViewController:self];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    [self UpdateEditMode];
    [self reloadPeopleBasicInfo];
    
    
    NSArray* array = [[NSArray alloc] initWithObjects:SexC count:SexN];
    UIHelperBase* baseHelper = [[StrPickerHelper alloc] init:_m_Sex :@selector(setSex:) :self :array];
    [UIHelperBase registUIHelper:baseHelper];
    
    array = [[NSArray alloc] initWithObjects:CityC count:CityN];
    baseHelper = [[StrPickerHelper alloc] init:_m_City :@selector(setCity:) :self :array];
    [UIHelperBase registUIHelper:baseHelper];
    
    array = [[NSArray alloc] initWithObjects:BuddyTypeC count:5];
   // baseHelper = [[StrPickerHelper alloc] init:_m_BuddyType :@selector(setBuddyType:) :self :array];
    baseHelper = [[MultiColumnStrPicker alloc] init:_m_BuddyType :@selector(setBuddyType:) :self :array :1];
    [UIHelperBase registUIHelper:baseHelper];
    
    array = [[NSArray alloc] initWithObjects:BuddyCloseC count:BuddyCloseN];
    baseHelper = [[StrPickerWithSearchHelper alloc] init:_m_BuddyCloseType :@selector(setBuddyCloseType:) :self :array];
    [UIHelperBase registUIHelper:baseHelper];
    
    baseHelper = [[DatePickerHelper alloc] init:_m_Birthday :@selector(setBirthday:) :self];
    [UIHelperBase registUIHelper:baseHelper];
    
    
    [_m_Name setDelegate:self];
    [_m_EnglishName setDelegate:self];
    [_m_Phone setDelegate:self];
    [_m_Email setDelegate:self];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [UIHelperBase releaseUIHelper];
}

- (IBAction)StatusButtonClick:(id)sender {
    if (_isEditMode) {
        _basicInfo.name = _m_Name.text;
        _basicInfo.english_name = _m_EnglishName.text;
        _basicInfo.phone = _m_Phone.text;
        _basicInfo.email = _m_Email.text;
        [DBHelper SaveAll];
        [self reloadPeopleBasicInfo];
    }
    _isEditMode = ! _isEditMode;
    [self UpdateEditMode];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (void) SaveEducation:(NSArray *)items
{
    CEducation* education = [[CEducation alloc] init];
    education.items = [items mutableCopy];
    _basicInfo.education = [education serialize];
    [DBHelper SaveAll];
}


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    _basicInfo.name = _m_Name.text;
    _basicInfo.english_name = _m_EnglishName.text;
    _basicInfo.phone = _m_Phone.text;
    _basicInfo.email = _m_Email.text;
    [DBHelper SaveAll];
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    id dest = [segue destinationViewController];
    if ([dest isKindOfClass:[CGenericItemSetView class]]) {
        CGenericItemSetView* destView = dest;
        destView.item_key = EducationKey;
        destView.parent = self;
        CEducation* education = [[CEducation alloc] init];
        [education deserialize:_basicInfo.education];
        destView.items = education.items;
    } else {
        if (_basicInfo == nil) {
            NSManagedObjectContext* context = [DBHelper getContext];
            _basicInfo = [NSEntityDescription insertNewObjectForEntityForName:@"PersonalBasicInfo" inManagedObjectContext:context];
        }
        [dest setPersonalBasicInfo:_basicInfo];
    }
}

- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier compare:@"EditEducation"] == NSOrderedSame) {
        if (!_isEditMode)
            return FALSE;
        else
            return TRUE;
    }
    return TRUE;
}


@end
