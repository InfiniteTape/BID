//
//  BIDTaskDetailController.h
//  Seg Nav
//
//  Created by Brian Rogers on 3/30/12.
//  Copyright (c) 2012 infinitetape.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDTaskDetailController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (copy, nonatomic) NSDictionary *selection;
@property (weak, nonatomic) id delegate;

@end
