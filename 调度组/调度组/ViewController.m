//
//  ViewController.m
//  调度组
//
//  Created by jyh on 2017/12/13.
//  Copyright © 2017年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self group2];
}


/**
 
 */
- (void)group2 {
    
    // 创建调度组
    dispatch_group_t group = dispatch_group_create();
    
    // 队列
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
    
    // 入组
    dispatch_group_enter(group);
    
    dispatch_async(q, ^{
        
        NSLog(@"download a %@", [NSThread currentThread]);
        
        // 出组
        dispatch_group_leave(group);
    });
    
    // 入组
    dispatch_group_enter(group);
    
    dispatch_async(q, ^{
        
        NSLog(@"download b %@", [NSThread currentThread]);
        
        // 出组
        dispatch_group_leave(group);
    });
}

/**
 调度组最重要的目的是监听一组任务的完成
 */

- (void)group1 {
    
    // 创建调度组
    dispatch_group_t group = dispatch_group_create();
    
    // 队列
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
    
    // 调度组监听队列调度任务
    dispatch_group_async(group, q, ^{
        NSLog(@"download a %@", [NSThread currentThread]);
    });
    
    dispatch_group_async(group, q, ^{
        NSLog(@"download b %@", [NSThread currentThread]);
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"come here %@", [NSThread currentThread]);
    });
    
}

@end
