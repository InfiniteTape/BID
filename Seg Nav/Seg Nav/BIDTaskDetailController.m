//
//  BIDTaskDetailController.m
//  Seg Nav
//
//  Created by Brian Rogers on 3/30/12.
//  Copyright (c) 2012 infinitetape.com. All rights reserved.
//

#import "BIDTaskDetailController.h"

@interface BIDTaskDetailController ()

@end

@implementation BIDTaskDetailController
@synthesize textView;
@synthesize delegate;
@synthesize selection;

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
    textView.text = [selection objectForKey:@"object"];
    [textView becomeFirstResponder];
}

- (void)viewDidUnload
{
    [self setTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if([delegate respondsToSelector:@selector(setEditedSelection:)])
    {
        [textView endEditing:YES];
        NSIndexPath *indexPath = [selection objectForKey:@"indexPath"];
        id object = textView.text;
        NSDictionary *editedSelection = [NSDictionary dictionaryWithObjectsAndKeys:
                                   indexPath, @"indexPath",
                                   object, @"object",
                                   nil];
        [delegate setValue:editedSelection forKey:@"editedSelection"];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
