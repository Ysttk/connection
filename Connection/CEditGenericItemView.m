//
//  CEditGenericItemView.m
//  Connection
//
//  Created by 寿宝江 on 13-12-16.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "CEditGenericItemView.h"
#import "CGenericItemSetView.h"
#import "CHomeMember.h"
#import "CEducationItem.h"

@interface CEditGenericItemView ()

@end

@implementation CEditGenericItemView

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) init_widget
{
    NSIndexPath* path = [[NSIndexPath alloc] initWithIndex:0];
    NSArray* array = [[NSArray alloc] initWithObjects:path, nil];
    [self.tableView deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = NO;
    [self init_widget];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}



- (void) viewWillDisappear:(BOOL)animated
{
    NSIndexPath* path = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:path];
    [self performSelector:_persist_func withObject:cell];
    [UIHelper releaseUIHelper];
}

- (void) setItem:(id)item
{
    _item = item;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*******************CHomeMember*************/
- (void) setHomeBirthday: (NSDate*) date
{
    NSIndexPath* path = [NSIndexPath indexPathForRow:0 inSection:0];
    
    UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:path];
    NSArray* views = cell.contentView.subviews;
    UITextField* birthdayText = views[5];
    [birthdayText setText:[Utils getDateString:date]];
    [birthdayText resignFirstResponder];
}

- (void) home_init: (UITableViewCell*) cell
{
    CHomeMember* item = (CHomeMember*)_item;
    NSArray* views = cell.contentView.subviews;
    UITextField* homeRole = (UITextField*) views[1];
    [homeRole setText:item.role];
    UITextField* homeName = (UITextField*) views[3];
    [homeName setText:item.name];
    UITextField* homeBirthday = (UITextField*) views[5];
    [homeBirthday setText:[Utils getDateString:item.birthday]];
    UIHelper* helper = [UIHelper getUIHelper];
    [helper setDatePickerForTextField:homeBirthday :@selector(setHomeBirthday:) :self];
}

- (void) home_persist: (UITableViewCell*) cell
{
    CHomeMember* item = (CHomeMember*) _item;
    NSArray* views = cell.contentView.subviews;
    UITextField* homeRole = (UITextField*) views[1];
    UITextField* homeName = (UITextField*) views[3];
    UITextField* homeBirthday = (UITextField*) views[5];
    item.role = homeRole.text;
    item.name = homeName.text;
    item.birthday = [Utils getDateFromString:homeBirthday.text];
}

- (UITableViewCell*) getFirstRow
{
    NSIndexPath* path = [NSIndexPath indexPathForRow:0 inSection:0];
    return [self.tableView cellForRowAtIndexPath:path];
}

/****************CEducation*****************/

- (void) setEducationFrom: (NSDate*) date
{
    UITableViewCell* cell = [self getFirstRow];
    NSArray* array = cell.contentView.subviews;
    UITextField* from = array[0];
    [from setText:[Utils getDateString:date]];
    [from resignFirstResponder];
}

- (void) setEducationTo: (NSDate*) date
{
    UITableViewCell* cell = [self getFirstRow];
    NSArray* array = cell.contentView.subviews;
    UITextField* to = array[1];
    [to setText:[Utils getDateString:date]];
    [to resignFirstResponder];
}

- (void) education_init: (UITableViewCell*) cell
{
    NSArray* views = cell.contentView.subviews;
    CEducationItem* item = _item;
    UITextField* from = views[0];
    [from setText:[Utils getDateString:item.from]];
    UITextField* to = views[1];
    [to setText:[Utils getDateString:item.to]];
    UITextField* school = views[2];
    [school setText:item.school];
    UIHelper* helper = [UIHelper getUIHelper];
    [helper setDatePickerForTextField:from :@selector(setEducationFrom:) :self];
    helper = [UIHelper getUIHelper];
    [helper setDatePickerForTextField:to :@selector(setEducationTo:) :self];
}

- (void) education_persist: (UITableViewCell*) cell
{
    NSArray* views = cell.contentView.subviews;
    CEducationItem* item = _item;
    UITextField* from = views[0];
    UITextField* to = views[1];
    UITextField* school = views[2];
    
    item.from = [Utils getDateFromString:from.text];
    item.to = [Utils getDateFromString:to.text];
    item.school = school.text;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* dic = (NSDictionary*)[SetId2SetViewCellIdAndEditViewId valueForKey:_item_key];
    NSString *CellIdentifier = [dic valueForKey:EditRowId];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    [self performSelector:_init_func withObject:cell];
    // Configure the cell...
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _rowHeigh;
}

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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
