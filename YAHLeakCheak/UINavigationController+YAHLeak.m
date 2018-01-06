//
//  UINavigationController+YAHLeak.m
//  GB_Football
//
//  Created by yahua on 2018/1/6.
//  Copyright © 2018年 Go Brother. All rights reserved.
//

#import "UINavigationController+YAHLeak.h"
#import <objc/runtime.h>
#import "NSObject+YAHLeak.h"

@implementation UINavigationController (YAHLeak)

+ (void)load {
    
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(popViewControllerAnimated:)), class_getInstanceMethod(self, @selector(yah_popViewControllerAnimated:)));
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(popToViewController:animated:)), class_getInstanceMethod(self, @selector(yah_popToViewController:animated:)));
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(popToRootViewControllerAnimated:)), class_getInstanceMethod(self, @selector(yah_popToRootViewControllerAnimated:)));
}

- (UIViewController *)yah_popViewControllerAnimated:(BOOL)animated {
    
    UIViewController *vc = [self yah_popViewControllerAnimated:animated];
    
    [vc yah_willDealloc];
    
    return vc;
}

- (NSArray<UIViewController *> *)yah_popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    NSArray<UIViewController *> *vcList = [self yah_popToViewController:viewController animated:animated];
    
    for (UIViewController *vc in vcList) {
        [vc yah_willDealloc];
    }
    
    return vcList;
}

- (NSArray<UIViewController *> *)yah_popToRootViewControllerAnimated:(BOOL)animated {
    
    NSArray<UIViewController *> *vcList = [self yah_popToRootViewControllerAnimated:animated];
    
    for (UIViewController *vc in vcList) {
        [vc yah_willDealloc];
    }
    
    return vcList;
}

@end
