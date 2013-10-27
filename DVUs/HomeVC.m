//
//  HomeVC.m
//  DVUs
//
//  Created by pan Shiyu on 13-10-22.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import "HomeVC.h"
#import "DVBaseVC.h"

@implementation HomeVC {
    PopView *_popView;
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
	// Do any additional setup after loading the view.
    
    _popView = [[PopView alloc] init];
    
    CGRect r = _popView.frame;
    [self.view addSubview:_popView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 

- (IBAction)onDate {
    NSLog(@"onDate");
    [self performSegueWithIdentifier:@"sugueOnDate" sender:self];
}

- (IBAction)onShare {
    NSLog(@"onShare");
    [self performSegueWithIdentifier:@"segueOnShare" sender:self];
}

- (IBAction)onSetting {
    NSLog(@"onSetting");
    [self performSegueWithIdentifier:@"segueOnSetting" sender:self];
    
}

- (IBAction)onMessageList {
    NSLog(@"onMessageList");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    DVBaseVC *toVC = segue.destinationViewController;
//    if ([segue.identifier isEqualToString:@"sugueOnDate"]) {
//        toVC.enableSwipeBack = YES;
//    }
}


@end

#pragma mark - 

@implementation PopView


@end

@implementation PopCell

- (void)setTime:(NSString*)time info:(NSString*)info {
    _timeLabel.text = time;
    _infoLabel.text = info;
}

- (IBAction)onConfirm {
    NSLog(@"onConfirm");
}

- (IBAction)onDismiss {
    NSLog(@"onDismiss");
}

@end
