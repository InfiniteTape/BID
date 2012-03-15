//
//  BIDCheckListController.m
//  Nav
//
//  Created by Rogers, Brian A on 3/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BIDCheckListController.h"

@implementation BIDCheckListController

@synthesize list;
@synthesize lastIndexPath;

- (void)viewDidLoad { 
    [super viewDidLoad]; 
    NSArray *array = [[NSArray alloc] initWithObjects:@"Who Hash", @"Bubba Gump Shrimp Étouffée", @"Who Pudding", @"Scooby Snacks", @"Everlasting Gobstopper", @"Green Eggs and Ham", @"Soylent Green", @"Hard Tack", @"Lembas Bread", @"Roast Beast", @"Blancmange", nil];
    self.list = array;
}
    
- (void)viewDidUnload { 
    [super viewDidUnload]; 
    self.list = nil; 
    self.lastIndexPath = nil;
}
#pragma mark - 
#pragma mark Table Data Source Methods 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [list count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CheckMarkCellIdentifier = @"CheckMarkCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CheckMarkCellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CheckMarkCellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    NSUInteger oldRow = [lastIndexPath row];
    cell.textLabel.text = [list objectAtIndex:row];
    cell.accessoryType = (row == oldRow && lastIndexPath != nil) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    return cell;
    
}

#pragma mark - 
#pragma mark Table Delegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int newRow = [indexPath row];
    int oldRow = (lastIndexPath != nil) ? [lastIndexPath row] : -1;
    
    if(newRow != oldRow)
    {
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:lastIndexPath];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        lastIndexPath = indexPath;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
