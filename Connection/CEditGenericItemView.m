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



- (void) viewDidDisappear:(BOOL)animated
{
    [self performSelector:_persist_func withObject:nil];
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

- (void) setDate: (NSDate*) date
{
    
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
    UIHelper* helper = [[UIHelper alloc] init];
    [helper setDatePickerForTextField:homeBirthday :@selector(setDate:) :self];
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
    static NSString *CellIdentifier = @"EditHomeMember";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    [self performSelector:_init_func withObject:cell];
    // Configure the cell...
    
    return cell;
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
