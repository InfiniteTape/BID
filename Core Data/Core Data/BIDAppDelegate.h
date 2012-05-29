//
//  BIDAppDelegate.h
//  Core Data
//
//  Created by Brian Rogers on 5/29/12.
//  Copyright (c) 2012 infinitetape.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BIDViewController;

@interface BIDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) BIDViewController *rootController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
