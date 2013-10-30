//
//  SettingVC.m
//  DVUs
//
//  Created by pan Shiyu on 13-9-29.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import "SettingVC.h"

@implementation SettingVC{
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [(UIWebView*)self.view loadHTMLString:@"test" baseURL:[NSURL URLWithString:@"www.baidu.com"]];
//    - (void)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
