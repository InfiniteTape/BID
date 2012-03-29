//
//  BIDPresidentsViewController.m
//  Nav
//
//  Created by Rogers, Brian A on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BIDPresidentsViewController.h"
#import "BIDPresidentDetailController.h"
#import "BIDPresident.h"

@implementation BIDPresidentsViewController
@synthesize list;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Presidents" ofType:@"plist"];
    NSData *data;
    NSKeyedUnarchiver *unarchiver;
    
    data = [[NSData alloc] initWithContentsOfFile:path];
    unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    NSMutableArray *array = [unarchiver decodeObjectForKey:@"Presidents"];
    self.list = array;
    [unarchiver finishDecoding];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - 
#pragma mark Table Data Source Methods 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{ 
    return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *PresidentListCellIdentifier = @"PresidentListCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PresidentListCellIdentifier];
    if (cell == nil) 
    { 
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:PresidentListCellIdentifier];
    } 
    NSUInteger row = [indexPath row]; 
    BIDPresident *thePres = [self.list objectAtIndex:row]; 
    cell.textLabel.text = thePres.name; 
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@",                                                                                                                                                            thePres.fromYear, thePres.toYear]; 
    
    return cell;
}

#pragma mark - 
#pragma mark Table Delegate Methods 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    NSUInteger row = [indexPath row]; 
    BIDPresident *prez = [self.list objectAtIndex:row];
    BIDPresidentDetailController *childController = [[BIDPresidentDetailController alloc] initWithStyle:UITableViewStyleGrouped];
    childController.title = prez.name; 
    childController.president = prez;
    [self.navigationController pushViewController:childController animated:YES];
}

@end