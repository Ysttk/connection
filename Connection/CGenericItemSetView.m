//
//  CGenericItemSetView.m
//  Connection
//
//  Created by 寿宝江 on 13-12-16.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "CGenericItemSetView.h"
#import "CHomeStructure.h"
#import "CHomeMember.h"
#import "CEditGenericItemView.h"

@interface CGenericItemSetView ()

@end

@implementation CGenericItemSetView



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) setItems:(NSMutableArray *)items
{
    _items = items;
    [self.tableView reloadData];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    _toDetailPage = false;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) viewDidAppear:(BOOL)animated
{
    NSDictionary* dic = [SetId2SetViewCellIdAndEditViewId valueForKey:_item_key];
    NSString* className = [dic valueForKey:ClassKey];
    _item_class = NSClassFromString(className);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    [self.tableView reloadData];
    _toDetailPage = false;
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (_toDetailPage) return;
    NSDictionary* dic = [SetId2SetViewCellIdAndEditViewId valueForKey:_item_key];
    NSString* saveFunc = [dic valueForKey:SaveFuncKey];
    SEL func = NSSelectorFromString(saveFunc);
    [_parent performSelector:func withObject:_items];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* dic = [SetId2SetViewCellIdAndEditViewId valueForKey:_item_key];
    //NSString *CellIdentifier = @"GenericItemDisp";
    NSString *CellIdentifier = [dic valueForKey:DisplayRowId];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (_items != nil) {
        id item = [_items objectAtIndex:indexPath.row];
        [cell.textLabel setText:[item toString]];
        NSDictionary* dic = [SetId2SetViewCellIdAndEditViewId valueForKey:_item_key];
        NSNumber* num = [dic valueForKey:DisplayRowHeigh];
        UILabel* l = cell.textLabel;
        l.numberOfLines = 0;
        [l setFrame:CGRectMake(0, 0, [[UIScreen mainScreen] applicationFrame].size.width, num.integerValue)];
    }
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* dic = [SetId2SetViewCellIdAndEditViewId valueForKey:_item_key];
    NSNumber* num = [dic valueForKey:DisplayRowHeigh];
    return num.integerValue;
}

- (void) addItemToSet
{
    [_items addObject:_currentItem];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [_items removeObjectAtIndex:indexPath.row];
        [DBHelper SaveAll];
        [self.tableView reloadData];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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
    CEditGenericItemView* dest = (CEditGenericItemView*)[segue destinationViewController];
    
    //dest.init_func = @selector(home_init:);
   // dest.persist_func = @selector(home_persist:);
    //dest.init_func = NSSelectorFromString(@"home_init:");
    //dest.persist_func= NSSelectorFromString(@"home_persist:");
    NSDictionary* dic = (NSDictionary*)[SetId2SetViewCellIdAndEditViewId valueForKey:_item_key];
    NSString* initStr = (NSString*) [dic valueForKey:InitKey];
    NSString* persistStr = (NSString*) [dic valueForKey:PersistKey];
    NSNumber* heigh = (NSNumber*) [dic valueForKey:EditRowHeigh];
    dest.init_func = NSSelectorFromString(initStr);
    dest.persist_func = NSSelectorFromString(persistStr);
    dest.rowHeigh = heigh.intValue;
    dest.item_key = _item_key;
    dest.params = _params;
    id item = nil;
    if ([sender isKindOfClass:[UIBarButtonItem class]]) {
        _currentItem = [[_item_class alloc] init];
        item = _currentItem;
        dest.addMode = true;
        //[_items addObject:item];
    } else {
        item =[_items objectAtIndex: self.tableView.indexPathForSelectedRow.row];
        dest.addMode = false;
    }
    [dest setItem:item];
    
    _toDetailPage = true;
}

 

@end
