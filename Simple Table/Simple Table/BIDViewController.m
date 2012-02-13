//
//  BIDViewController.m
//  Simple Table
//
//  Created by Brian Rogers on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BIDViewController.h"

@implementation BIDViewController
@synthesize listData;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSArray *array = [[NSArray alloc] initWithObjects:@"Sleepy", @"Sneezy",
                      @"Bashful", @"Happy", @"Doc", @"Grumpy", @"Dopey", @"Thorin", @"Dorin", @"Nori", @"Ori", @"Balin", @"Dwalin", @"Fili", @"Kili", @"Oin", @"Gloin", @"Bifur", @"Bofur", @"Bombur", nil];
    self.listData = array;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.listData = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listData count]; 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:SimpleTableIdentifier]; 
    }
    
    UIImage *image = [UIImage imageNamed:@"star.png"];
    cell.imageView.image = image;
    
    UIImage *highlightedImage = [UIImage imageNamed:@"star2.png"];
    cell.imageView.highlightedImage = highlightedImage;
    
    NSUInteger row = [indexPath row]; 
    cell.textLabel.text = [listData objectAtIndex:row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:50.0];
    
    if (row < 7)
        cell.detailTextLabel.text = @"Disney";
    else
        cell.detailTextLabel.text = @"Tolkien";
    
    return cell;
}

#pragma mark -
#pragma mark Table View Delegate Methods

-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    return row;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    if(row==0) return nil;
    return indexPath;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    NSString *rowValue = [listData objectAtIndex:row];
    NSString *message = [[NSString alloc] initWithFormat:@"You selected %@", rowValue];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Row Selected!" message:message delegate:nil cancelButtonTitle:@"Yes, I did!" otherButtonTitles:nil];
    [alert show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

@end
