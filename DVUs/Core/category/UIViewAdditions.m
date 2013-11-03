//
//  UIViewAdditions.m
//  iMeituanHD
//
//  Created by 李 帅 on 12-2-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIViewAdditions.h"

@implementation UIView(Frame)

- (void) setTop:(CGFloat)t {
	self.frame = CGRectMake(self.left, t, self.width, self.height);
}
- (CGFloat) top {
	return self.frame.origin.y;
}
- (void) setBottom:(CGFloat)b {
	self.frame = CGRectMake(self.left,b-self.height,self.width,self.height);
}
- (CGFloat) bottom {
	return self.frame.origin.y + self.frame.size.height;
}
- (void) setLeft:(CGFloat)l {
	self.frame = CGRectMake(l,self.top,self.width,self.height);
}
- (CGFloat) left {
	return self.frame.origin.x;
}
- (void) setRight:(CGFloat)r {
	self.frame = CGRectMake(r-self.width,self.top,self.width,self.height);
}
- (CGFloat) right {
	return self.frame.origin.x + self.frame.size.width;
}
- (void) setWidth:(CGFloat)w {
	self.frame = CGRectMake(self.left, self.top, w, self.height);
}
- (CGFloat) width {
	return self.frame.size.width;
}
- (void) setHeight:(CGFloat)h {
	self.frame = CGRectMake(self.left, self.top, self.width, h);
}
- (CGFloat) height {
	return self.frame.size.height;
}

@end



@implementation UIView (ViewHiarachy)
- (UIViewController*)viewController {
	for (UIView* next = self; next; next = next.superview) {
		UIResponder* nextResponder = [next nextResponder];
		if ([nextResponder isKindOfClass:[UIViewController class]]) {
			return (UIViewController*)nextResponder;
		}
	}
	return nil;
}
- (void)removeAllSubviews {
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
}
@end


@implementation UIView (gesture)

- (void)addTapAction:(SEL)tapAction target:(id)target {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:tapAction];
    [self addGestureRecognizer:gesture];
}

@end
