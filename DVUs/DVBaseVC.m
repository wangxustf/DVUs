//
//  DVBaseVC.m
//  DVUs
//
//  Created by pan Shiyu on 13-10-22.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import "DVBaseVC.h"

@interface DVBaseVC ()

@end

@implementation DVBaseVC


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if (_enableSwipeBack) {
        UISwipeGestureRecognizer *swipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(onGestureBack)];
        swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
        [self.view addGestureRecognizer:swipeGesture];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onGestureBack {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
