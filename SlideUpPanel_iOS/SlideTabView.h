//
//  RPViewController.h
//  RoundProgress
//
//  Created by Arun Kumar.P on 20/03/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kDockUp=0,
    kDockMiddle,
    kDockDown,
}TableState;


@interface SlideTabView: UITableView

@property (nonatomic)TableState tState;
@end
