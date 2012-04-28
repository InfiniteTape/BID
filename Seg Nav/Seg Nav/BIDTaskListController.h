//
//  BIDTaskListController.h
//  Simple Storyboard
//
//  Created by Brian Rogers on 3/30/12.
//  Copyright (c) 2012 infinitetape.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDTaskListController : UITableViewController
@property (strong, nonatomic) NSMutableArray *tasks;
@property (copy, nonatomic) NSDictionary *editedSelection;
@end
