//
//  DVUIComponents.m
//  DVUs
//
//  Created by pan Shiyu on 13-11-10.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import "DVUIComponents.h"

@implementation DVCountLabel

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.layer.cornerRadius = 8;
        self.textAlignment = NSTextAlignmentCenter;
        
        self.text = @"1";
        [self sizeToFit];
        
        [UIApplication sharedApplication].statusBarHidden = YES;
    }
    return self;
}


@end
