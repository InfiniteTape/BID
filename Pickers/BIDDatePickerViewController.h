//
//  BIDDatePickerViewController.h
//  Pickers
//
//  Created by Brian Rogers on 12/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDDatePickerViewController : UIViewController

@property (strong, atomic) IBOutlet UIDatePicker *datePicker;
-(IBAction)buttonPressed;

@end
