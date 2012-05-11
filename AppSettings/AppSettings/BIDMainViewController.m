//
//  BIDMainViewController.m
//  AppSettings
//
//  Created by Rogers, Brian A on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BIDMainViewController.h"

@implementation BIDMainViewController

@synthesize usernameLabel;
@synthesize passwordLabel; 
@synthesize protocolLabel; 
@synthesize warpDriveLabel; 
@synthesize warpFactorLabel; 
@synthesize favoriteTeaLabel; 
@synthesize favoriteCandyLabel; 
@synthesize favoriteGameLabel;
@synthesize favoriteExcuseLabel; 
@synthesize favoriteSinLabel;

- (void)refreshFields 
{ 
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]; 
    usernameLabel.text = [defaults objectForKey:kUsernameKey]; 
    passwordLabel.text = [defaults objectForKey:kPasswordKey]; 
    protocolLabel.text = [defaults objectForKey:kProtocolKey]; 
    warpDriveLabel.text = [defaults boolForKey:kWarpDriveKey]
        ? @"Engaged" : @"Disabled"; 
    warpFactorLabel.text = [[defaults objectForKey:kWarpFactorKey] stringValue]; 
    favoriteTeaLabel.text = [defaults objectForKey:kFavoriteTeaKey];
    favoriteCandyLabel.text = [defaults objectForKey:kFavoriteCandyKey]; 
    favoriteGameLabel.text = [defaults objectForKey:kFavoriteGameKey]; 
    favoriteExcuseLabel.text = [defaults objectForKey:kFavoriteExcuseKey]; 
    favoriteSinLabel.text = [defaults objectForKey:kFavoriteSinKey];
}
    
    

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
    [self refreshFields];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.usernameLabel = nil; self.passwordLabel = nil; self.protocolLabel = nil; self.warpDriveLabel = nil; self.warpFactorLabel = nil; self.favoriteTeaLabel = nil; self.favoriteCandyLabel = nil; self.favoriteGameLabel = nil; self.favoriteExcuseLabel = nil; self.favoriteSinLabel = nil;
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

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(BIDFlipsideViewController *)controller
{
    [self refreshFields];
    [self dismissModalViewControllerAnimated:YES];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
