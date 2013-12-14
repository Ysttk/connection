//
//  PersonalInfo.m
//  Connection
//
//  Created by 寿宝江 on 13-10-4.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "PersonalBasicInfoView.h"


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

- (void) setBasicInfo: (PersonalBasicInfo*) basicInfo
{
    _basicInfo = basicInfo;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self UpdateStatusItem];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (IBAction)StatusButtonClick:(id)sender {
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
    id dest = [segue destinationViewController];
    [dest setBasicInfo:_basicInfo];
}



@end
