//
//  BIDRowControlsController.m
//  Nav
//
//  Created by Brian Rogers on 3/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BIDRowControlsController.h"

@interface BIDRowControlsController ()

@end

@implementation BIDRowControlsController

@synthesize list;

-(IBAction)buttonTapped:(id)sender
{
    UIButton *senderButton = (UIButton *)sender;
    UITableViewCell *buttonCell = (UITableViewCell *)[senderButton superview];
    NSUInteger buttonRow = [[self.tableView indexPathForCell:buttonCell] row];
    NSString *buttonTitle = [list objectAtIndex: buttonRow];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You tapped the button" message:[NSString stringWithFormat:@"You tapped the button for %@", buttonTitle] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
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
    NSArray *array = [[NSArray alloc] initWithObjects:@"R2-D2",
                      @"C3PO", @"Tik-Tok", @"Robby", @"Rosie", @"Uniblab", @"Bender", @"Marvin", @"Lt. Commander Data",
                      @"Evil Brother Lore", @"Optimus Prime", @"Tobor", @"HAL", @"Orgasmatron", nil];
    self.list = array;
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [list count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ControlRowIdentifier = @"ControlRowIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ControlRowIdentifier];
    if (cell == nil) 
    {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:ControlRowIdentifier];
        UIImage *buttonUpImage = [UIImage imageNamed:@"button_up.png"];
        UIImage *buttonDownImage = [UIImage imageNamed:@"button_down.png"];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0.0, 0.0, buttonUpImage.size.width, buttonUpImage.size.height );
        [button setBackgroundImage:buttonUpImage forState:UIControlStateNormal];
        [button setBackgroundImage:buttonDownImage forState:UIControlStateHighlighted];
        [button setTitle:@"Tap" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonTapped:)
            forControlEvents:UIControlEventTouchUpInside]; 
        cell.accessoryView = button;
    }
    NSUInteger row = [indexPath row];
    NSString *rowTitle = [list objectAtIndex:row]; 
    cell.textLabel.text = rowTitle;
    return cell;
}

#pragma mark -
#pragma mark Table Delegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    NSString *rowTitle = [list objectAtIndex:row];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You tapped the row." message:[NSString stringWithFormat:@"You tapped %@.", rowTitle] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
