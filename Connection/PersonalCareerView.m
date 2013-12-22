//
//  PersonalDetailInfoView.m
//  Connection
//
//  Created by 寿宝江 on 13-10-4.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "PersonalCareer.h"
#import "PersonalBasicInfo.h"
#import "CGenericItemSetView.h"
#import "CExperience.h"
#import "CSkillSet.h"
#import "CCareer.h"
#import "PersonalDetails.h"

@interface PersonalCareer ()


@end

@implementation PersonalCareer

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


- (void) viewWillAppear:(BOOL)animated
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

}
- (IBAction)BeginEditSport:(id)sender {
    //[_picker reloadAllComponents];
}
- (IBAction)BeginEditPlace:(id)sender {
    //[_picker reloadAllComponents];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*
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

- (void) setPersonalBasicInfo: (PersonalBasicInfo*) basicInfo
{
    _basicInfo = basicInfo;
}

- (PersonalBasicInfo*) getPersonalBasicInfo
{
    return _basicInfo;
}

- (void) SaveCareer: (NSArray*) items
{
    CCareer* career = [[CCareer alloc] init];
    career.fields = [items mutableCopy];
    _basicInfo.my_details.career = [career serialize];
}

- (void) SaveExperience: (NSArray*) items
{
    CExperience* exp = [[CExperience alloc] init];
    exp.items = [items mutableCopy];
    _basicInfo.my_details.history = [exp serialize];
}

- (void) SaveSkill: (NSArray*) items
{
    CSkillSet* set = [[CSkillSet alloc] init];
    set.skills = [items mutableCopy];
    _basicInfo.my_details.skills = [set serialize];
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



@end
