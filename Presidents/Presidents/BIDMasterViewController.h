//
//  BIDMasterViewController.h
//  Presidents
//
//  Created by Rogers, Brian A on 4/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BIDDetailViewController;

@interface BIDMasterViewController : UITableViewController

@property (strong, nonatomic) BIDDetailViewController *detailViewController;
@property (strong, nonatomic) NSArray *presidents;
@end
