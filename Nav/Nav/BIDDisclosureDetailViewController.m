//
//  BIDDisclosureDetailViewController.m
//  Nav
//
//  Created by Rogers, Brian A on 3/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BIDDisclosureDetailViewController.h"

@implementation BIDDisclosureDetailViewController
@synthesize label;
@synthesize message;

-(void)viewWillAppear:(BOOL)animated
{
    label.text = message;
    [super viewWillAppear:animated];
}

-(void)viewDidUnload
{
    self.label = nil;
    self.message = nil;
    [super viewDidUnload];
}


@end
