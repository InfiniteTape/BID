//
//  BIDMoveMeController.m
//  Nav
//
//  Created by Brian Rogers on 3/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BIDMoveMeController.h"

@interface BIDMoveMeController ()

@end

@implementation BIDMoveMeController
@synthesize list;

- (IBAction)toggleMove
{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    if(self.tableView.editing)
        [self.navigationItem.rightBarButtonItem setTitle:@"Done"];
    else
        [self.navigationItem.rightBarButtonItem setTitle:@"Move"];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if (list == nil) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects: @"Eeny", @"Meeny", @"Miney", @"Moe", @"Catch", @"A", @"Tiger", @"By", @"The", @"Toe", nil];
        self.list = array; 
    }
    UIBarButtonItem *moveButton = [[UIBarButtonItem alloc] initWithTitle:@"Move" style:UIBarButtonItemStyleBordered target:self action:@selector(toggleMove)];
    self.navigationItem.rightBarButtonItem = moveButton; 
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.list = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Table Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section 
{ 
    return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *MoveMeCellIdentifier = @"MoveMeCellIdentifier";
    UITableViewCell *cell = [tableView
        dequeueReusableCellWithIdentifier:MoveMeCellIdentifier]; 
    if (cell == nil) 
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MoveMeCellIdentifier];
        cell.showsReorderControl = YES; 
    }
    NSUInteger row = [indexPath row]; 
    cell.textLabel.text = [list objectAtIndex:row];
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath 
       toIndexPath:(NSIndexPath *)toIndexPath 
{
    NSUInteger fromRow = [fromIndexPath row];
    NSUInteger toRow = [toIndexPath row];
    id object = [list objectAtIndex:fromRow];
    [list removeObjectAtIndex:fromRow];
    [list insertObject:object atIndex:toRow];
}


@end
