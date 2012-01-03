//
//  BIDViewController.h
//  Button Fun
//
//  Created by Brian Rogers on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *statusText;
- (IBAction)buttonPressed:(id)sender;
@end
