//
//  RPViewController.m
//  RoundProgress
//
//  Created by Arun Kumar.P on 20/03/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "SlideTabView.h"

@interface SlideTabView()
@end

@implementation SlideTabView

@synthesize tState;


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    CGPoint velocity = [(UIPanGestureRecognizer *)gestureRecognizer velocityInView:self];
    
    NSLog(@"shoulde begin++++++++++++++%f",velocity.y);
    if (velocity.y > 0 && self.tState == kDockUp && self.contentOffset.y <=0 ) {
        return NO;
    }else if(velocity.y < 0 && self.tState == kDockMiddle){
        return NO;
    }
    
    return YES;
}
@end
