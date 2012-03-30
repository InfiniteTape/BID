//
//  BIDPresidentDetailController.h
//  Nav
//
//  Created by Rogers, Brian A on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BIDPresident;
#define kNumberOfEditableRows       4
#define kNameRowIndex               0
#define kFromYearRowIndex           1
#define kToYearRowIndex             2
#define kPartyIndex                 3

#define kLabelTag                   4096

@interface BIDPresidentDetailController : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) BIDPresident *president;
@property (strong, nonatomic) NSArray *fieldLabels;
@property (strong, nonatomic) NSMutableDictionary *tempValues;
@property (strong, nonatomic) UITextField *currentTextField;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)textFieldDone:(id)sender;

@end
