//
//  RPViewController.h
//  RoundProgress
//
//  Created by Arun Kumar.P on 20/03/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
#import "SlideViewController.h"
#import "SlideTabView.h"


@interface SlideTabViewController : UITableViewController
@property (nonatomic)EGORefreshTableHeaderView *headView;

@property (strong, nonatomic) IBOutlet SlideTabView *myTableView;

-(void)ScrollEnable:(Boolean)enable;
@end
