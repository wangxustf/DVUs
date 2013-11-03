//
//  UIViewControllerAdditions.h
//  iMeituan
//
//  Created by psy on 12-10-31.
//
//

#import <Foundation/Foundation.h>

//访问堆栈中上一个viewController
@interface UIViewController (preViewController)

- (UIViewController*)preViewController;

@end
