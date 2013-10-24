//
//  FirstViewController.m
//  DVUs
//
//  Created by pan Shiyu on 13-9-24.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import "MyActivityListVC.h"
#import "ActivityDetailVC.h"

@implementation MyActivityListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_actList reloadData];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [DataCenter sharedDataCenter].undoList.count;
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *tmpCell = nil;
    static NSString *cellIdentifier = @"UndoActTableCell";
    DVActivity *tmpMessage = nil;
    
    tmpMessage = [[DataCenter sharedDataCenter].undoList objectAtIndex:indexPath.row];
    
    tmpCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!tmpCell) {
        tmpCell = [[UndoActTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    ((UndoActTableCell*)tmpCell).refMessage = tmpMessage;
    
    return tmpCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DVActivity *tmpMessage = nil;
    tmpMessage = [[DataCenter sharedDataCenter].undoList objectAtIndex:indexPath.row];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ActivityDetailVC *vc = [sb instantiateViewControllerWithIdentifier:@"MessageEditVC"];
    vc.outMessage = tmpMessage;
    
    [self.navigationController pushViewController:vc animated:YES];
    
    //segueActDetail
    
}


- (IBAction)onAdd {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"MessageEditVC"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end

#pragma mark - format data -----------------------------

@implementation UndoActTableCell

- (void)setRefMessage:(DVActivity *)refMessage {
    _refMessage = refMessage;
    if (_refMessage) {
        self.timeLabel.text = _refMessage.timeStr;
        self.infoLabel.text = _refMessage.title;
    }
}

@end
