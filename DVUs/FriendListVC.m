//
//  SecondViewController.m
//  DVUs
//
//  Created by pan Shiyu on 13-9-24.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import "FriendListVC.h"

@implementation FriendListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if (_isModeAddFriend) {
        UIBarButtonItem * tmpItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(onBack)];
        self.navigationItem.leftBarButtonItem =tmpItem;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void) onBack {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [DataCenter sharedDataCenter].friendList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *tmpCell = nil;
    static NSString *cellIdentifier = @"FriendTableCell";
    DVFriend *tmpFriend = [[DataCenter sharedDataCenter].friendList objectAtIndex:indexPath.row];
    
    tmpCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!tmpCell) {
        tmpCell = [[FriendTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    ((FriendTableCell*)tmpCell).refFriend = tmpFriend;
    return tmpCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!_isModeAddFriend) {
        [_friendList reloadData];
    } else {
//        if ([DataCenter sharedDataCenter].activeMessage) {
//            DVFriend *tmpFriend = [[DataCenter sharedDataCenter].friendList objectAtIndex:indexPath.row];
//            [[DataCenter sharedDataCenter].activeMessage.friendList addObject:tmpFriend];
//        }
        if (_refMessage) {
            DVFriend *tmpFriend = [[DataCenter sharedDataCenter].friendList objectAtIndex:indexPath.row];
            [_refMessage.friendList addObject:tmpFriend];
        }
        
        [self onBack];
    }
}


@end

#pragma mark - 

@implementation FriendTableCell

- (void)setRefFriend:(DVFriend *)refFriend {
    _refFriend = refFriend;
    
    if (_refFriend) {
        _nameLabel.text = _refFriend.name;
        _faceImageview.image = [UIImage imageNamed:_refFriend.faceImage];
    }
}

@end
