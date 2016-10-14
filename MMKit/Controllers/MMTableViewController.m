//
//  BATableViewController.m
//  Demo
//
//  Created by houzhenyong on 14/11/2.
//  Copyright (c) 2014年 hou zhenyong. All rights reserved.
//
/**
 * 在loadView里将tableView直接赋值给self.view的话，如果在tableView上addSubView。。。
 * 如果将子View add到tableView的SuperView上，也会有问题。
 * 所以，改为将tableView add到self.view上，省去不必要的麻烦。
 */

#import "MMCommonDefines.h"
#import "MMTableViewController.h"

@interface MMTableViewController ()

@end

@implementation MMTableViewController

- (id)init
{
    if (self = [super init]) {
        _bottomBarHeight = 0.f;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self __buildTableView];

    self.automaticallyAdjustsScrollViewInsets = NO;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(PHONE_NAVIGATIONBAR_HEIGHT + PHONE_STATUSBAR_HEIGHT,
                                                  0,
                                                  _bottomBarHeight,
                                                  0);
    self.tableView.contentInset = contentInsets;
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(contentInsets.top, 0, contentInsets.bottom, 0);
}

- (void)__buildTableView
{
    if (!self.tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:tableView];
        tableView.dataSource = self;
        tableView.delegate = self;
        self.tableView = tableView;
    }
}


#pragma mark- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [self performSelector:@selector(bb_deselectCell) withObject:nil afterDelay:0.5];
}

- (void)bb_deselectCell {
    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:NO];
}

@end
