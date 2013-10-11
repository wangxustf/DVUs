//
//  UIViewControllerAdditions.m
//  iMeituan
//
//  Created by psy on 12-10-31.
//
//

#import "UIViewControllerAdditions.h"

@implementation UIViewController (preViewController)

- (UIViewController*)preViewController{
    
    //通过parentViewController来判断
    if (self.parentViewController) {
        //push 页面
        if (self.navigationController) {
            int nowIndex = [self.navigationController.viewControllers indexOfObject:self.navigationController.topViewController];
            if (nowIndex  >= 1) {
                return [self.navigationController.viewControllers objectAtIndex:nowIndex -1];
            }
        }

        return nil;
    }else{
        //present的页面
        //return self.presentingViewController;
        //present出来的页面暂时无法访问上一个页面，暂不处理
    }
    
    return nil;
}

@end
