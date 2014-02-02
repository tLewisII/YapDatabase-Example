//
//  TJLViewController.m
//  YapDatabase Example
//
//  Created by Terry Lewis II on 2/2/14.
//  Copyright (c) 2014 Blue Plover Productions LLC. All rights reserved.
//

#import "TJLViewController.h"
#import "TJLAppDelegate.h"
#import "TJLTestModel.h"
#import <YapDatabase/YapDatabase.h>
#import <YapDatabase/YapDatabaseView.h>

@interface TJLViewController () <UITableViewDataSource>
@property(weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic) YapDatabaseConnection *connection;
@property(strong, nonatomic) YapDatabaseViewMappings *mappings;
@end

@implementation TJLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"YapDatabase Example";
    TJLAppDelegate *delegate = (TJLAppDelegate *)[UIApplication sharedApplication].delegate;
    self.tableView.dataSource = self;

    self.connection = [delegate.database newConnection];

    [self.connection beginLongLivedReadTransaction];
    self.mappings = [[YapDatabaseViewMappings alloc]initWithGroups:@[@"name"] view:TJLTableViewViewName];

    [self.connection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
        [self.mappings updateWithTransaction:transaction];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.mappings numberOfItemsInSection:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.mappings.numberOfSections;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    __block TJLTestModel *model;
    NSString *group = [self.mappings groupForSection:indexPath.section];
    [self.connection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
        model = [[transaction ext:TJLTableViewViewName]objectAtIndex:indexPath.row inGroup:group];
    }];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.subtitle;
    return cell;
}

@end
