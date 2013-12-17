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

- (void) reloadPersonalBasicInfo
{
    if (_basicInfo == nil) return;
    CHomeStructure* home = [[CHomeStructure alloc] init];
    [home deserialize:_basicInfo.home_member];
    [_m_HomeIntro setText:[home toString]];
    
    [_m_Interest setText:_basicInfo.intresters];
    [_m_Habit setText:_basicInfo.habit];
}

- (void) UpdateByEditModel
{
    if (_isEditModel)
        [_m_StatusBtn setTitle:@"完成"];
    else
        [_m_StatusBtn setTitle:@"编辑"];
    
    
}

- (IBAction)AddHomeMember:(id)sender {
    CHomeStructure* home = [[CHomeStructure alloc] init];
    [home deserialize:_basicInfo.home_member];
    CHomeMember* member = [[CHomeMember alloc] init];
    member.role = _m_HomeRole.text;
    member.name = _m_HomeName.text;
    member.birthday = [Utils getDateFromString:_m_HomeBirthday.text];
    [home addMember:member];
    _basicInfo.home_member = [home serialize];
    [DBHelper SaveAll];
}

- (IBAction)SwitchEditModel:(id)sender {
    if (_isEditModel) {
        _basicInfo.intresters = _m_Interest.text;
        _basicInfo.habit = _m_Habit.text;
        [DBHelper SaveAll];
    }
    _isEditModel = ! _isEditModel;
    [self UpdateByEditModel];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self reloadPersonalBasicInfo];
    [self UpdateByEditModel];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
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



#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UIViewController* dest = [segue destinationViewController];
    if ([dest isKindOfClass:[CGenericItemSetView class]] ) {
        CGenericItemSetView* destView = (CGenericItemSetView*) dest;
        //destView.item_class = NSClassFromString(@"CHomeMember");
        NSDictionary* dic = (NSDictionary*) [SetId2SetViewCellIdAndEditViewId valueForKey:HomeKey];
        NSString* className = (NSString*) [dic valueForKey:@"class"];
        destView.item_class = NSClassFromString(className);
        destView.item_key = HomeKey;
        CHomeStructure* home = [[CHomeStructure alloc] init];
        [home deserialize:_basicInfo.home_member];
        destView.items = home.members;
    }
}



@end
