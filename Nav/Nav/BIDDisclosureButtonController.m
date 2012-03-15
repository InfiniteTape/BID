//
//  BIDDisclosureButtonController.m
//  Nav
//
//  Created by Rogers, Brian A on 3/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BIDDisclosureButtonController.h"
#import "BIDAppDelegate.h"
#import "BIDDisclosureDetailViewController.h"

@interface BIDDisclosureButtonController () 
@property (strong, nonatomic) BIDDisclosureDetailViewController *childController;
@end

@implementation BIDDisclosureButtonController
@synthesize list;
@synthesize childController;

-(void) viewDidLoad 
{
    [super viewDidLoad];
    NSArray *array = [[NSArray alloc] initWithObjects:@"Toy Story", @"A Bug's Life", @"Toy Story 2", @"Monsters, Inc.", @"Finding Nemo", @"The Incredibles", @"Cars", @"Ratatouille", @"WALL-E", @"Up", @"Toy Story 3", @"Cars 2", @"Brave", nil];
    self.list = array;
}

-(void) viewDidUnload
{
    [super viewDidUnload];
    self.list = nil;
    self.childController = nil;
}

#pragma mark -
#pragma mark Table Data Source Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [list count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *DisclosureButtonCellIdentifier = @"DisclosureButtonCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DisclosureButtonCellIdentifier];
    if(cell==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DisclosureButtonCellIdentifier];
    }
    NSUInteger row = [indexPath row];
    NSString *rowString = [list objectAtIndex:row];
    cell.textLabel.text = rowString;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

#pragma mark - 
#pragma mark Table Delegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath     
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hey, do you see the disclosure button?" message:@"If you want to drill down, touch that instead." delegate:nil cancelButtonTitle:@"Won't happen again" otherButtonTitles: nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    if(childController == nil)
    {
        childController = [[BIDDisclosureDetailViewController alloc] initWithNibName:@"BIDDisclosureDetail" bundle:nil];
    }
    childController.title = @"Disclosure Button Pressed";
    NSUInteger row = [indexPath row];
    NSString *selectedMovie = [list objectAtIndex:row];
    NSString *detailMessage = [[NSString alloc] initWithFormat:@"You pressed the disclosure button for %@.", selectedMovie];
    childController.message = detailMessage;
    childController.title = selectedMovie;
    [self.navigationController pushViewController:childController animated:YES];
}

@end
