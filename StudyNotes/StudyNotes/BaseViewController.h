//
//  BaseViewController.h
//  Data Structures And Algorithms In C
//
//  Created by Michael Dong on 12/27/13.
//  Copyright (c) 2013 Michael Dong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property(nonatomic,retain) NSArray  *tableContents;
@property(nonatomic,retain) NSArray  *tableCellDescription;

@property(nonatomic,strong) UITableView *tableView;



@property(nonatomic,weak) id <UITableViewDataSource> dataSource;
@property(nonatomic,weak) id <UITableViewDelegate>   delegate;


@end
