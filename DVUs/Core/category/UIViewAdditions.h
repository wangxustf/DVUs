//
//  UIViewAdditions.h
//  DVActivity
//
//  Created by pan Shiyu on 13-4-25.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView(Frame)

@property (nonatomic,assign)float top;
@property (nonatomic,assign)float bottom;
@property (nonatomic,assign)float left;
@property (nonatomic,assign)float right;
@property (nonatomic,assign)float width;
@property (nonatomic,assign)float height;

@end



@interface UIView(ViewHiarachy)

@property (nonatomic,readonly)UIViewController *viewController;

- (void)removeAllSubviews;
@end



@interface UIView (gesture)

- (void)addTapAction:(SEL)tapAction target:(id)target;
@end