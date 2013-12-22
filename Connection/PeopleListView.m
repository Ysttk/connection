//
//  PeopleListView.m
//  Connection
//
//  Created by 寿宝江 on 13-10-28.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "PeopleListView.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "PersonalBasicInfo.h"
#import "PersonalCareer.h"
#import "Connection.h"
#import "PersonalBasicInfoView.h"

@interface PeopleListView ()

@end

@implementation PeopleListView

@synthesize personalInfoArray = _personalInfoArray;


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

    [self updatePeopleList];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //return 2;
    return [_personalInfoArray count];
}

- (NSDateComponents*) getDateComponents:(NSDate*) date
{
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSInteger flag = NSYearCalendarUnit |
    NSMonthCalendarUnit |
    NSDayCalendarUnit |
    NSWeekdayCalendarUnit |
    NSHourCalendarUnit  |
    NSMinuteCalendarUnit  |
    NSSecondCalendarUnit;
    NSDateComponents* components = [calendar components:flag fromDate:date];
    return components;
}

- (NSInteger)getYear:(NSDate*) date
{
    NSDateComponents* components = [self getDateComponents:date];
    int year = [components year];
    return year;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSInteger index = indexPath.row;
    PersonalBasicInfo* info = _personalInfoArray[index];
    // Configure the cell...
    NSArray* labels = (NSArray*)cell.contentView.subviews;
    UILabel* name = (UILabel*)labels[0];
    [name setText:info.name];
    
    NSDate* now = [NSDate date];
    NSInteger personalAge = [self getYear:now] - [self getYear:info.birthday];
    UILabel* age = labels[1];
    [age setText:[NSString stringWithFormat:@"%d", personalAge]];
    
    UILabel* buddy_close = labels[2];
    [buddy_close setText:info.buddy_closer_type];
    
    UILabel* buddy_type = labels[3];
    [buddy_type setText:info.buddy_type];
    
    UILabel* career = labels[4];
    NSMutableString* careerStr = [[NSMutableString alloc] init];
    bool preStr = false;
    if (info.my_details.profession != nil) {
        [careerStr appendString:[NSString stringWithFormat:@"%@", info.my_details.profession]];
        preStr = true;
    }
    if (info.my_details.company != nil) {
        if (preStr) [careerStr appendString:@"."];
        [careerStr appendString:[NSString stringWithFormat:@"%@", info.my_details.company]];
        preStr = true;
    }
    if (info.my_details.position != nil) {
        if (preStr) [careerStr appendString:@"."];
        [careerStr appendString:[NSString stringWithFormat:@"%@", info.my_details.position]];
    }
    [career setText:careerStr];
    
    return cell;
}

- (void) updatePeopleList
{
    NSManagedObjectContext* context = [DBHelper getContext];
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription* descript  = [NSEntityDescription entityForName:@"PersonalBasicInfo" inManagedObjectContext:context];
    [fetchRequest setEntity:descript];
    NSError* error;
    NSArray* array = [context executeFetchRequest:fetchRequest error:&error];
    self.personalInfoArray = [array mutableCopy];
    if (_personalInfoArray == nil) {
        _personalInfoArray = [[NSMutableArray alloc] init];
        
    }
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


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UINavigationController* navi = (UINavigationController*)[self parentViewController];
    navi.navigationBar.hidden  = YES;
    PersonalBasicInfo* basicInfo = nil;
    if (sender == _m_AddBtn) {
        basicInfo = [NSEntityDescription insertNewObjectForEntityForName:@"PersonalBasicInfo" inManagedObjectContext:[DBHelper getContext]];
        [_personalInfoArray addObject:basicInfo];
    } else {
        NSIndexPath* path = [self.tableView indexPathForSelectedRow];
        basicInfo = [_personalInfoArray objectAtIndex:path.row];
    }
    id dest = [segue destinationViewController];
    [dest setPersonalBasicInfo:basicInfo];
}



@end
