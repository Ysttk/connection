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


@interface PersonalBasicInfoView ()

@end

@interface DatePickDelegate : NSObject <UIPickerViewDelegate>

@end

@implementation DatePickDelegate



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
    
    //formate education information
    CEducation* education = [[CEducation alloc] init];
    [education deserialize:_basicInfo.education];
    [_m_EducationBackgroud setText:[education toString]];
}

- (void) showEmptyTextView: (UITextView*) textView :(bool) isShow
{
    if (([textView.text compare:@""] == NSOrderedSame) && ! isShow)
        textView.hidden = YES;
    else
        textView.hidden = NO;
    
}

- (void) showEmptyTextField: (UITextField*) textField :(bool) isShow
{
    if (([textField.text compare:@""] == NSOrderedSame) && !isShow)
        textField.hidden = YES;
    else
        textField.hidden = NO;
}

- (void) showEmptyTextFieldWithLabel: (UILabel*) label :(UITextField*) textField :(bool) isShow
{
    if (([textField.text compare:@""] == NSOrderedSame) && !isShow) {
        textField.hidden = YES;
        label.hidden = YES;
    } else {
        textField.hidden = NO;
        label.hidden = NO;
    }
}

- (void) UpdateStatusItem
{
    if (! _isEditMode)
        [_m_StatusActionButton setTitle:@"编辑"];
    else
        [_m_StatusActionButton setTitle:@"完成"];
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
    
    [_m_Age setEnabled:isEditable];
    [self showEmptyTextField:_m_Age :isShowEmpty];
    
    [_m_EnglishName setEnabled:isEditable];
    [self showEmptyTextField:_m_EnglishName :isShowEmpty];
    
    [_m_Phone setEnabled:isEditable];
    [self showEmptyTextFieldWithLabel:_m_PhoneLbl :_m_Phone :isShowEmpty];
    
    [_m_Email setEnabled:isEditable];
    [self showEmptyTextFieldWithLabel:_m_EmailLbl :_m_Email :isShowEmpty];
    
    [_m_Birthday setEnabled:isEditable];
    [self showEmptyTextField:_m_Birthday :isShowEmpty];
    
    [_m_EducationBackgroud setEditable:isEditable];
    [self showEmptyTextView:_m_EducationBackgroud :isShowEmpty];
    
    [self UpdateStatusItem];
    
    
}
- (IBAction)BeginEditBirthday:(id)sender {
    _currentEditor = _m_Birthday;
}

- (IBAction)BeginEditEducationBeginTime:(id)sender
{
    _currentEditor = _m_EducationBeginTime;
}

- (IBAction)BeginEditEducationEndTime:(id)sender
{
    _currentEditor = _m_EducationEndTime;
}

- (IBAction)EducationOKClick:(id)sender
{
    //load date from text field
    NSString* school = _m_EducationSchool.text;
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString* tmpDateStr = _m_EducationBeginTime.text;
    NSDate*  beginDate = [formatter dateFromString:tmpDateStr];
    tmpDateStr = _m_EducationEndTime.text;
    NSDate* endDate = [formatter dateFromString:tmpDateStr];
    
    //save date
    CEducationItem* item = [[CEducationItem alloc] initWithValue:beginDate :endDate :school];
    CEducation* education = [[CEducation alloc] init];
    [education deserialize:_basicInfo.education];
    [education addEducationItem:item];
    _basicInfo.education = [education serialize];
    [_m_EducationBackgroud setText:[education toString]];
    
    //clear date in text field
    [_m_EducationBeginTime setText:@""];
    [_m_EducationEndTime setText:@""];
    [_m_EducationSchool setText:@""];
}

- (IBAction)DateEditDone:(id)sender
{
    NSDate* selDate = [_birthdayPicker date];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    [_currentEditor setText:[formatter stringFromDate:selDate]];
    [_currentEditor resignFirstResponder];
}

- (UIBarPosition) positionForBar:(id<UIBarPositioning>)bar
{
    return UIBarPositionTop;
}

- (void) initEditView
{
    _birthdayPicker = [[UIDatePicker alloc] init];
    _birthdayPicker.datePickerMode = UIDatePickerModeDate;

    self.pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]applicationFrame].size.width, 30)];
    [self.pickerToolbar setDelegate:self];
    
    
    UIBarButtonItem* tmpOK = [[UIBarButtonItem alloc] initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:self action:@selector(DateEditDone:)];
    
    UIBarButtonItem* placeHolder = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray* items = [NSArray arrayWithObjects: placeHolder, tmpOK, nil];
    [self.pickerToolbar setItems:items];
    
    _m_Birthday.inputAccessoryView = _pickerToolbar;
    _m_Birthday.inputView = _birthdayPicker;
    
    _m_EducationBeginTime.inputAccessoryView = _pickerToolbar;
    _m_EducationBeginTime.inputView = _birthdayPicker;
    _m_EducationEndTime.inputAccessoryView = _pickerToolbar;
    _m_EducationEndTime.inputView = _birthdayPicker;
    
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    
    [self initEditView];
    [self reloadPeopleBasicInfo];
    [self UpdateStatusItem];
    [self UpdateEditMode];
    
    id parent = [self parentViewController];
    [parent registCurrentSubViewController:self];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (IBAction)StatusButtonClick:(id)sender {
    if (_isEditMode) {
        _basicInfo.name = _m_Name.text;
        _basicInfo.phone = _m_Phone.text;
        _basicInfo.email = _m_Email.text;
        _basicInfo.english_name = _m_EnglishName.text;
        _basicInfo.birthday = [Utils getDateFromString:_m_Birthday.text];
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




#pragma mark - Table view data source


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
 */

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if (_basicInfo == nil) {
        NSManagedObjectContext* context = [DBHelper getContext];
        _basicInfo = [NSEntityDescription insertNewObjectForEntityForName:@"PersonalBasicInfo" inManagedObjectContext:context];
    }
    id dest = [segue destinationViewController];
    [dest setPersonalBasicInfo:_basicInfo];
}



@end
