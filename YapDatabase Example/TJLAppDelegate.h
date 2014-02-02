//
//  TJLAppDelegate.h
//  YapDatabase Example
//
//  Created by Terry Lewis II on 2/2/14.
//  Copyright (c) 2014 Blue Plover Productions LLC. All rights reserved.
//

extern NSString *const TJLTableViewViewName;
extern NSString *const TJLTableViewCollectionName;

#import <UIKit/UIKit.h>

@class YapDatabase;
@class YapDatabaseView;

@interface TJLAppDelegate : UIResponder <UIApplicationDelegate>

@property(strong, nonatomic) UIWindow *window;

@property(strong, nonatomic) YapDatabase *database;
@property(strong, nonatomic) YapDatabaseView *databaseView;

- (YapDatabase *)sharedYapDatabase;

@end
