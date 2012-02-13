//
//  BIDViewController.h
//  Cells
//
//  Created by Rogers, Brian A on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
 
@property (strong, nonatomic) NSArray *computers; 

@end
