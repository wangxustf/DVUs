//
//  UIFontAdditions.m
//  DVActivity
//
//  Created by pan Shiyu on 13-4-25.
//  Copyright (c) 2013年 pan Shiyu. All rights reserved.
//

#import "UIFontAdditions.h"


@implementation UIFont (frame)

- (CGFloat)singleLineHeight {
	return (self.ascender - self.descender)+1;
}

@end

