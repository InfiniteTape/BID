//
//  BIDFlipsideViewController.h
//  AppSettings
//
//  Created by Rogers, Brian A on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BIDFlipsideViewController;

@protocol BIDFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(BIDFlipsideViewController *)controller;
@end

@interface BIDFlipsideViewController : UIViewController

@property (weak, nonatomic) IBOutlet id <BIDFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
