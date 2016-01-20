//
//  DVBaseVC.m
//  DVUs
//
//  Created by pan Shiyu on 13-10-22.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import "DVBaseVC.h"

@implementation DVBaseVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self checkIfEnableSwipeRight];
}

- (void)checkIfEnableSwipeRight {
    _enableSwipeBack = YES;
    
    if (self.navigationController.viewControllers.count > 0) {
        UIViewController *rootVC = [self.navigationController.viewControllers objectAtIndex:0];
        if (self == rootVC) {
            _enableSwipeBack = NO;
        }
    }
    
    if (!_enableSwipeBack){
        return;
    }
    
    UISwipeGestureRecognizer *swipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(onGestureBack)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
} 

- (void)onGestureBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

@end
