//
//  BATableViewController.h
//  Demo
//
//  Created by houzhenyong on 14/11/2.
//  Copyright (c) 2014年 hou zhenyong. All rights reserved.
//

#import "MMViewController.h"

@interface MMTableViewController : MMViewController <UITableViewDataSource, UITableViewDelegate>{
@protected
    CGFloat _bottomBarHeight;
}

@property (nonatomic, strong) UITableView *tableView;

@end
