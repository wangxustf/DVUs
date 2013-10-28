//
//  MessageEditVC.m
//  DVUs
//
//  Created by pan Shiyu on 13-10-10.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import "ActivityDetailVC.h"
#import "CMCommonCategory.h"
#import "DataCenter.h"
#import "FriendListVC.h"

@interface ActivityDetailVC ()
@property (nonatomic, strong) NSMutableIndexSet *optionIndices;
@end

@implementation ActivityDetailVC {
    DVActivity *_newMessage;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapBackground)];
    [self.view addGestureRecognizer:tap];
    
    self.optionIndices = [NSMutableIndexSet indexSetWithIndex:1];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (_outMessage) {
        _titleTextfield.text = _outMessage.title;
        _contentTextview.text = _outMessage.content;
        _timeLabel.text = [_outMessage.time yyyyMMdd];
    }else if(!_newMessage){
        _newMessage = [DVActivity emptyMessage];
        _timeLabel.text = [_newMessage.time yyyyMMdd];
    }
    
    [_faceCollectionView reloadData];
}

#pragma mark - methods

- (IBAction)onBack {
    [DataCenter sharedDataCenter].activeMessage = nil;
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)onUpdate {
    if (_outMessage) {
        _outMessage.title = _titleTextfield.text;
        _outMessage.content = _contentTextview.text;
    } else {
        [[DataCenter sharedDataCenter].undoList addObject:_newMessage];
    }
    [self onBack];
}

- (IBAction)onAddFriend {
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    FriendListVC *vc = [sb instantiateViewControllerWithIdentifier:@"FriendListVC"];
//    vc.isModeAddFriend = YES;
//    DVActivity *currentMessage = _outMessage ? _outMessage : _newMessage;
//    [DataCenter sharedDataCenter].activeMessage = currentMessage;
//    
//    vc.refMessage = currentMessage;
//    [self.navigationController pushViewController:vc animated:YES];
    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:[self faceImgsArray] selectedIndices:self.optionIndices borderColors:[self colorsArray]];
    //    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images];
    callout.delegate = self;
    callout.showFromRight = YES;
    [callout show];
}

- (NSArray*)faceImgsArray {
    NSMutableArray *imgsArray = [NSMutableArray arrayWithCapacity:[DataCenter sharedDataCenter].friendList.count];
    for (DVFriend *friend in [DataCenter sharedDataCenter].friendList) {
        [imgsArray addObject:[UIImage imageNamed:friend.faceImage]];
    }
    return imgsArray;
}

- (NSArray*)colorsArray {
    NSMutableArray *colorsArray = [NSMutableArray arrayWithCapacity:[DataCenter sharedDataCenter].friendList.count];
    for (int i=0; i < [DataCenter sharedDataCenter].friendList.count; i++) {
        [colorsArray addObject:[UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1]];
    }
    return colorsArray;
}

- (IBAction)onValueChanged:(UISlider*)sender {
    // value 是 0~720 1个月，30天 * 24 。每单位是1小时
    NSDate *tmpNewDate = [NSDate dateWithTimeIntervalSinceNow:sender.value * 60 * 60];
    if (_outMessage) {
        _outMessage.time = tmpNewDate;
    } else {
        _newMessage.time = tmpNewDate;
    }
    
    _timeLabel.text = [tmpNewDate yyyyMMdd];
}

- (void)onTapBackground {
    if ([_contentTextview isFirstResponder]) {
        [_contentTextview resignFirstResponder];
    }
    
    if ([_titleTextfield isFirstResponder]) {
        [_titleTextfield resignFirstResponder];
    }

}

#pragma mark - delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

#pragma mark - 

- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
    NSLog(@"Tapped item at index %i",index);
    
    DVFriend *tmpFriend = [[DataCenter sharedDataCenter].friendList objectAtIndex:index];
    DVActivity *currentMessage = _outMessage ? _outMessage : _newMessage;
    [currentMessage.friendList addObject:tmpFriend];
    
    [_faceCollectionView reloadData];
    
    [sidebar dismiss];
}

- (void)sidebar:(RNFrostedSidebar *)sidebar didEnable:(BOOL)itemEnabled itemAtIndex:(NSUInteger)index {
    if (itemEnabled) {
        [self.optionIndices addIndex:index];
    }
    else {
        [self.optionIndices removeIndex:index];
    }
}

#pragma mark - collections delegate
//集合代理-每一部分数据项
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    DVActivity *currentMessage = _outMessage ? _outMessage : _newMessage;
    return currentMessage.friendList.count;
}


//Cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"FaceCell";
    FaceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    DVActivity *currentMessage = _outMessage ? _outMessage : _newMessage;
    cell.refFriend = [currentMessage.friendList objectAtIndex:indexPath.row];
    return cell;
}

//代理－选择行的触发事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end


@implementation FaceCell

- (void)setRefFriend:(DVFriend *)refFriend {
    _refFriend = refFriend;
    
    if (_refFriend) {
        _faceImageview.image = [UIImage imageNamed:_refFriend.faceImage];
    }
}

@end
