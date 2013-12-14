//
//  PeopleInfoBarController.m
//  Connection
//
//  Created by 寿宝江 on 13-12-14.
//  Copyright (c) 2013年 Org. All rights reserved.
//

#import "PeopleInfoBarController.h"

@interface PeopleInfoBarController ()

@end

@implementation PeopleInfoBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _peopleBasicInfo = nil;
    }
    return self;
}

- (void)setBasicInfo: (PersonalBasicInfo*) basicInfo
{
    _peopleBasicInfo = basicInfo;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (_peopleBasicInfo == nil) {
        NSManagedObjectContext* context = [DBHelper getContext];
        _peopleBasicInfo = (PersonalBasicInfo*) [NSEntityDescription insertNewObjectForEntityForName:@"PersonalBasicInfo" inManagedObjectContext:context];
    }
    id dest = [segue destinationViewController];
    [dest setBasicInfo:_peopleBasicInfo];
}

@end
