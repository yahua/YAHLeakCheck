//
//  UIViewController+YAHLeak.m
//  GB_Football
//
//  Created by yahua on 2018/1/6.
//  Copyright © 2018年 Go Brother. All rights reserved.
//

#import "UIViewController+YAHLeak.h"
#import <objc/runtime.h>
#import "NSObject+YAHLeak.h"

@implementation UIViewController (YAHLeak)

+ (void)load {
    
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(dismissViewControllerAnimated:completion:)), class_getInstanceMethod(self, @selector(yah_dismissViewControllerAnimated:completion:)));
}

- (void)yah_dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    
    [self yah_dismissViewControllerAnimated:YES completion:nil];
    
    [self yah_willDealloc];
}

@end
