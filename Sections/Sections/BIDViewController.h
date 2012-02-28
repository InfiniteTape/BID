//
//  BIDViewController.h
//  Sections
//
//  Created by Brian Rogers on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSDictionary *names;
@property (strong, nonatomic) NSArray *keys;

@end
