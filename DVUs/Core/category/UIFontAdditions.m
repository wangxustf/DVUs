//
//  UIFontAdditions.m
//  LBiPhone
//
//  Created by spaceli on 11-8-5.
//  Copyright 2011年 diandian. All rights reserved.
//

#import "UIFontAdditions.h"


@implementation UIFont (frame)

- (CGFloat)singleLineHeight {
	return (self.ascender - self.descender)+1;
}

@end

