//
//  NSObject+YAHLeak.m
//  GB_Football
//
//  Created by yahua on 2018/1/6.
//  Copyright © 2018年 Go Brother. All rights reserved.
//

#import "NSObject+YAHLeak.h"

#define kAfterTimeLenght 3

@implementation NSObject (YAHLeak)

- (void)yah_willDealloc {
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kAfterTimeLenght * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        NSString *tips = [NSString stringWithFormat:@"leak %@", strongSelf.description];
        if (strongSelf) {
            NSLog(@"%@", tips);
        }
    });
}

@end
