//
//  BIDSwitchViewController.m
//  View Switcher
//
//  Created by Brian Rogers on 12/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BIDSwitchViewController.h"
#import "BIDYellowViewController.h"
#import "BIDBlueViewController.h"

@implementation BIDSwitchViewController
@synthesize yellowViewController;
@synthesize blueViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
    if(self.blueViewController.view.superview == nil) {
        self.blueViewController = nil;
    }
    else {
        self.yellowViewController = nil;
    }
}

#pragma mark - View lifecycle




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    self.blueViewController = [[BIDBlueViewController alloc] initWithNibName:@"BlueView" bundle:nil];
    [self.view insertSubview:self.blueViewController.view atIndex:0];
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)switchViews:(id)sender {
    [UIView beginAnimations:@"View Flip" context:nil]; 
    [UIView setAnimationDuration:1.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    if (self.yellowViewController.view.superview == nil) { 
        if (self.yellowViewController == nil) {
            self.yellowViewController =
            [[BIDYellowViewController alloc] initWithNibName:@"YellowView"
                                                  bundle:nil];
        }
        [UIView setAnimationTransition:
         UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
        [self.blueViewController.view removeFromSuperview];
        [self.view insertSubview:self.yellowViewController.view atIndex:0]; 
    } 
    else {
            if (self.blueViewController == nil) {
                self.blueViewController =
                [[BIDBlueViewController alloc] initWithNibName:@"BlueView"
                                                        bundle:nil];
            }
            [UIView setAnimationTransition:
             UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
            [self.yellowViewController.view removeFromSuperview];
            [self.view insertSubview:self.blueViewController.view atIndex:0]; 
    }
    [UIView commitAnimations];
}



@end
