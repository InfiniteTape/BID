//
//  BIDViewController.m
//  Core Data
//
//  Created by Brian Rogers on 5/29/12.
//  Copyright (c) 2012 infinitetape.com. All rights reserved.
//

#import "BIDViewController.h"
#import "BIDAppDelegate.h"

@interface BIDViewController ()

@end

@implementation BIDViewController

@synthesize line1;
@synthesize line2;
@synthesize line3;
@synthesize line4;

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
    // Do any additional setup after loading the view from its nib.
    BIDAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Line" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if(objects == nil)
    {
        NSLog(@"There was an error!");
    }
    
    for(NSManagedObject *oneObject in objects)
    {
        NSNumber *lineNum = [oneObject valueForKey:@"lineNum"];
        NSString *lineText = [oneObject valueForKey:@"lineText"];
        NSString *fieldName = [NSString stringWithFormat:@"line%d", [lineNum integerValue]];
        UITextField *theField = [self valueForKey:fieldName];
        [theField setText:lineText];
    }
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.line1 = nil;
    self.line2 = nil;
    self.line3 = nil;
    self.line4 = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)applicationWillResignActive:(NSNotification *)notification
{
    BIDAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    for (int i = 1; i < 4; i++)
    {
        NSString *fieldName = [NSString stringWithFormat:@"line%d", i];
        UITextField *theField = [self valueForKey:fieldName];
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Line" inManagedObjectContext:context];
        [request setEntity:entityDescription];
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"(lineNum = %d)", i];
        [request setPredicate:pred];
        
        NSManagedObject *theLine = nil;
        
        NSArray *objects = [context executeFetchRequest:request error:&error];
        if(objects == nil)
            NSLog(@"There was an error!");
        
        if([objects count] > 0)
            theLine = [objects objectAtIndex:0];
        else 
            theLine = [NSEntityDescription insertNewObjectForEntityForName:@"Line" inManagedObjectContext:context];
        
        [theLine setValue:[NSNumber numberWithInt:i] forKey:@"lineNum"];
        [theLine setValue:theField.text forKey:@"lineText"];
    }
    [context save:&error];
}

@end
