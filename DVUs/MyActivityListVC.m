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
    if (section == 0) { // undo
        return [DataCenter sharedDataCenter].undoList.count;
    } else {
        return [DataCenter sharedDataCenter].doneList.count;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *tmpCell = nil;
    static NSString *cellIdentifier = @"DoneActTableCell";
    DVActivity *tmpMessage = nil;
    if (indexPath.section == 0) {
        cellIdentifier = @"UndoActTableCell";
        tmpMessage = [[DataCenter sharedDataCenter].undoList objectAtIndex:indexPath.row];
        
        tmpCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!tmpCell) {
            tmpCell = [[UndoActTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        ((UndoActTableCell*)tmpCell).refMessage = tmpMessage;
    } else {
        cellIdentifier = @"DoneActTableCell";
        tmpMessage = [[DataCenter sharedDataCenter].doneList objectAtIndex:indexPath.row];
        
        tmpCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!tmpCell) {
            tmpCell = [[DoneActTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        ((DoneActTableCell*)tmpCell).refMessage = tmpMessage;
    }
    
    return tmpCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DVActivity *tmpMessage = nil;
    if (indexPath.section == 0) {
        tmpMessage = [[DataCenter sharedDataCenter].undoList objectAtIndex:indexPath.row];
    } else {
        tmpMessage = [[DataCenter sharedDataCenter].doneList objectAtIndex:indexPath.row];
    }
    
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

@implementation DoneActTableCell

- (void)setRefMessage:(DVActivity *)refMessage {
    _refMessage = refMessage;
    
    if (_refMessage) {
        _timeLabel.text = _refMessage.timeStr;
        _infoLabel.text = _refMessage.title;
    }
}

@end

@implementation UndoActTableCell

- (void)setRefMessage:(DVActivity *)refMessage {
    _refMessage = refMessage;
    if (_refMessage) {
        self.timeLabel.text = _refMessage.timeStr;
        self.infoLabel.text = _refMessage.title;
    }
}

@end
