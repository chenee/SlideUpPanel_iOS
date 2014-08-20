//
//  RPViewController.m
//  RoundProgress
//
//  Created by Arun Kumar.P on 20/03/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "SlideTabViewController.h"

@interface SlideTabViewController ()<EGORefreshTableHeaderDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic) Boolean reloading;
@end

@implementation SlideTabViewController

//@synthesize tState;
@synthesize headView;
@synthesize reloading;

#pragma mark -

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.headView == nil) {
        EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.myTableView.bounds.size.height, self.view.frame.size.width, self.myTableView.bounds.size.height)];
        view.delegate = self;
        [self.myTableView addSubview:view];
        self.headView = view;
    }
    //  update the last update date
    [self.headView refreshLastUpdatedDate];
    
    
    
}
-(void)ScrollEnable:(Boolean)enable{
//    self.myTableView.scrollEnabled = enable;
    [self.myTableView setUserInteractionEnabled:enable];
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource
{
    
    //  should be calling your tableviews data source model to reload
    //  put here just for demo
    self.reloading = YES;
//    [self refreshAction];
}

- (void)doneLoadingTableViewData
{
    
    //  model should call this when its done loading
    self.reloading = NO;
    
    [self.headView  egoRefreshScrollViewDataSourceDidFinishedLoading:self.myTableView];
    
}
#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
    
//    NSLog(@"refresh did ");
    [self reloadTableViewDataSource];
    
    //test
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
    
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
    
//    NSLog(@"refresh ing....");
    return self.reloading; // should return if data source model is reloading
    
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
    
    return [NSDate date]; // should return date data source was last changed
}
#pragma mark -
#pragma mark UIScrollViewDelegate Methods

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if (self.myTableView.tState == kDockUp && scrollView.contentOffset.y < 0) {
        [scrollView setContentOffset:CGPointZero];
    } else if (self.myTableView.tState == kDockMiddle && scrollView.contentOffset.y>0){
        [scrollView setContentOffset:CGPointZero];
        
    }
    
    [self.headView egoRefreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{

    [self.headView egoRefreshScrollViewDidEndDragging:scrollView];
    
}

#pragma mark - Memory functions

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 13;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell :%ld select!!",(long)indexPath.row);
    
    switch ([indexPath row]) {
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            break;
        case 5:
            break;
        case 6:
            break;
        case 7:
            break;
        case 8:
            break;
        case 9:
            break;
        case 10:
            break;
        case 11:
            break;
        case 12:
            break;
            
        default:
//            [self setMsg:@"not impletement"];
            break;
    }
    
}
-(void)setCell:(UITableViewCell*)cell at:(NSInteger)idx{
    
    NSArray* textArray = @[@"0 test title",
                           @"1 test title",
                           @"2 test title",
                           @"3 test title",
                           @"4 test title",
                           @"5 test title",
                           @"6 test title",
                           @"7 test title",
                           @"8 ",
                           @"9 ",
                           @"10 ",
                           @"11 ",
                           @"12 ",
                           ];
    NSArray* subTextArray = @[@"0000",
                              @"11111",
                              @"2222",
                              @"333",
                              @"444444",
                              @"55555",
                              @"6666",
                              @"7777",
                              @"888",
                              @"999",
                              @"1000",
                              @"1001",
                              @"1002",
                              ];
    
    cell.textLabel.text = [textArray objectAtIndex:idx];
    cell.detailTextLabel.text = [subTextArray objectAtIndex:idx];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    
    [self setCell:cell at:[indexPath row]];
    
    return cell;
}

@end
