//
//  BIDFirstLevelControllerViewController.m
//  Nav
//
//  Created by Brian Rogers on 3/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BIDFirstLevelControllerViewController.h"
#import "BIDSecondLevelViewController.h"
#import "BIDDisclosureButtonController.h"
#import "BIDCheckListController.h"
#import "BIDRowControlsController.h"
#import "BIDMoveMeController.h"

@interface BIDFirstLevelController ()

@end

@implementation BIDFirstLevelController

@synthesize controllers;

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"First Level";
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    //Disclosure Button
    BIDDisclosureButtonController *disclosureButtonController = [[BIDDisclosureButtonController alloc] initWithStyle:UITableViewStylePlain];
    disclosureButtonController.title = @"Disclosure Buttons";
    disclosureButtonController.rowImage = [UIImage imageNamed:@"disclosureButtonControllerIcon.png"];
    [array addObject:disclosureButtonController];
    
    //Checklist 
    BIDCheckListController *checkListController = [[BIDCheckListController alloc] initWithStyle:UITableViewStylePlain];
    checkListController.title = @"Check One";
    checkListController.rowImage = [UIImage imageNamed:@"checkmarkControllerIcon.png"];
    [array addObject:checkListController];
    
    //Table Row Controls
    BIDRowControlsController *rowControlsController = [[BIDRowControlsController alloc] initWithStyle:UITableViewStylePlain];
    rowControlsController.title = @"Row Controls";
    rowControlsController.rowImage = [UIImage imageNamed:@"rowControlsIcon.png"];
    [array addObject:rowControlsController];
    
    //Move Me
    BIDMoveMeController *moveMeController = [[BIDMoveMeController alloc] initWithStyle:UITableViewStylePlain];
    moveMeController.title = @"Move Me";
    moveMeController.rowImage = [UIImage imageNamed:@"moveMeIcon.png"];
    [array addObject:moveMeController];
    
    
    self.controllers = array;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.controllers = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.controllers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *firstLevelCell = @"FirstLevelCell";
    UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:firstLevelCell];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:firstLevelCell];
    }
    //Configure the cell
    
    NSUInteger row = [indexPath row];
    BIDSecondLevelViewController *controller = [controllers objectAtIndex:row];
    cell.textLabel.text = controller.title;
    cell.imageView.image = controller.rowImage;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    BIDSecondLevelViewController *nextController = [self.controllers objectAtIndex:row];
    [self.navigationController pushViewController:nextController animated:YES];
}

@end
