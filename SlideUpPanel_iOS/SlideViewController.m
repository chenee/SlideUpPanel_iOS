//
//  RPViewController.m
//  RoundProgress
//
//  Created by Arun Kumar.P on 20/03/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "SlideViewController.h"
#import "SlideTabViewController.h"
#import "SlideTabView.h"

#define kHeaderHeight 200
#define kPositionZero 160

@interface SlideViewController ()
@property (weak, nonatomic) IBOutlet UIView *myContainer;
@property (nonatomic)SlideTabViewController *myTableController;
@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;
@end

@implementation SlideViewController {
    CGPoint _origin;
    CGFloat duration;
    CGPoint currentPoint;
}
@synthesize panGesture;


#pragma mark - View functions

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myTableController = [self.childViewControllers objectAtIndexedSubscript:0];
    
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
    [self.myContainer addGestureRecognizer:self.panGesture];
//    CGRect rect = self.myContainer.frame;
//    rect.size.height = [self.view bounds].size.height - kPositionZero;
//    [self.myContainer setFrame:rect];
//    [self openAndCloseMenu];
}

#pragma mark - Memory functions

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma --
#pragma mark - Gesture

-(void)openAndCloseMenu{
    
    
    CGPoint finalOrigin;
    CGRect f = self.myContainer.frame;
    
    if (f.origin.y == kPositionZero)
        finalOrigin.y = CGRectGetHeight([UIScreen mainScreen].bounds) - kHeaderHeight;
    else
        finalOrigin.y = kPositionZero;
    
    finalOrigin.x = 0;
    f.origin = finalOrigin;
    [UIView animateWithDuration:.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.myContainer.transform = CGAffineTransformIdentity;
                         self.myContainer.frame = f;
                         
                     } completion:^(BOOL finished) {
                         [self.myTableController ScrollEnable:true];
                         
                         if (self.myContainer.frame.origin.y == kPositionZero) {
                             NSLog(@"........UP");
                             self.myTableController.myTableView.tState = kDockUp;
                         } else{
                             NSLog(@"........Middle");
                             self.myTableController.myTableView.tState = kDockMiddle;
                         }
                         
                     }];
    
    
}

- (void)onPan:(UIPanGestureRecognizer *)pan
{
    CGPoint translation = [pan translationInView:self.myContainer];
    CGPoint velocity = [pan velocityInView:self.myContainer];
    
    switch (pan.state) {
            
        case UIGestureRecognizerStateBegan:
            _origin = self.myContainer.frame.origin;
            NSLog(@"%f,%f",_origin.y,translation.y);
            break;
        case UIGestureRecognizerStateChanged:
            
            NSLog(@"%f,%f",_origin.y,translation.y);
        {
            float y = _origin.y + translation.y;
            float y2 = CGRectGetHeight([UIScreen mainScreen].bounds) - kHeaderHeight;
            
            if (y >= kPositionZero && y <= y2){
                CGRect f = self.myContainer.frame;
                CGPoint finalOrigin = CGPointMake(0, y);
                f.origin = finalOrigin;
                self.myContainer.transform = CGAffineTransformIdentity;
                self.myContainer.frame = f;
            }
        }
            
            break;
        case UIGestureRecognizerStateEnded:
            
        case UIGestureRecognizerStateCancelled:
        {
            CGPoint finalOrigin = CGPointMake(0, kPositionZero);
            if (velocity.y >= 0) {
                finalOrigin.y = CGRectGetHeight([UIScreen mainScreen].bounds) - kHeaderHeight;
            }
            
            CGRect f = self.myContainer.frame;
            f.origin = finalOrigin;
            
            currentPoint = finalOrigin;
            
            [UIView animateWithDuration:.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 self.myContainer.transform = CGAffineTransformIdentity;
                                 self.myContainer.frame = f;
                                 
                             } completion:^(BOOL finished) {
                                 [self.myTableController ScrollEnable:true];
                                 
                                 if (self.myContainer.frame.origin.y == kPositionZero) {
                                     NSLog(@"........UP");
                                     self.myTableController.myTableView.tState = kDockUp;
                                 } else{
                                     NSLog(@"........Middle");
                                     self.myTableController.myTableView.tState = kDockMiddle;
                                 }
                             }];
            
        }
            break;
            
        default:
            break;
    }
}

@end
