//
//  ViewController.m
//  MYTest
//
//  Created by 周海 on 16/7/28.
//  Copyright © 2016年 zhouhai. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //----------------
    
    //串行队列 同步和异步
    [self demo1];
    [self demo2];
    //-------------
    
    
    //并行队列 同步和异步
//        [self demo3];
//        [self demo4];
    //-------------
    
    //串行队列和并行队列的同步
//    [self demo1];
//    [self demo3];
    //---------------
    
    //串行队列和并行队列的异步
//    [self demo2];
//    [self demo4];
    
}

-(void)demo1
{
    //创建串行队列关键字 DISPATCH_QUEUE_SERIAL
    //   并行队列关键字 DISPATCH_QUEUE_CONCURRENT
    dispatch_queue_t queue=dispatch_queue_create("itcast", DISPATCH_QUEUE_SERIAL);
    
    
    //创建任务
    
    //加入队列
    
    //同步的方式 执行队列
    dispatch_sync(queue, ^{
        NSLog(@"%@ 串行队列 同步执行了方法1",[NSThread currentThread]);
        
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"%@ 串行队列 同步执行了方法1",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"%@ 串行队列 同步执行了方法2",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"%@ 串行队列 同步执行了方法3",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"%@ 串行队列 同步执行了方法4",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"%@ 串行队列 同步执行了方法5",[NSThread currentThread]);
    });
    

}

//异步的方式 执行串行队列 会创建一个新的线程来执行任务
-(void)demo2
{
    //创建串行队列关键字 DISPATCH_QUEUE_SERIAL
    //   并行队列关键字 DISPATCH_QUEUE_CONCURRENT
    
    dispatch_queue_t queue=dispatch_queue_create("itcast", DISPATCH_QUEUE_SERIAL);
    
    //创建任务
    dispatch_block_t task1=^{
        NSLog(@"%@ 串行队列 异步执行了方法1",[NSThread currentThread]);
    };
    
    dispatch_block_t task2=^{
        NSLog(@"%@ 串行队列 异步执行了方法2",[NSThread currentThread]);
    };
    
    dispatch_block_t task3=^{
        NSLog(@"%@ 串行队列 异步执行了方法3",[NSThread currentThread]);
    };
    
    dispatch_block_t task4=^{
        NSLog(@"%@ 串行队列 异步执行了方法4",[NSThread currentThread]);
    };
    
    dispatch_block_t task5=^{
        NSLog(@"%@ 串行队列 异步执行了方法5",[NSThread currentThread]);
    };
    
    
    //加入队列
    
    //异步的方式 执行队列
    
    //会顺序执行
    dispatch_async(queue, task1);
    
    dispatch_async(queue, task2);
    
    dispatch_async(queue, task3);
    
    dispatch_async(queue, task4);
    
    dispatch_async(queue, task5);
    
}

//并行队列，同步的方式执行  并不会开辟新线程
-(void)demo3
{
    //创建串行队列关键字 DISPATCH_QUEUE_SERIAL
    //   并行队列关键字 DISPATCH_QUEUE_CONCURRENT
    dispatch_queue_t queue=dispatch_queue_create("itcast", DISPATCH_QUEUE_CONCURRENT);
    
    //创建任务
    dispatch_block_t task1=^{
        NSLog(@"%@ 并行队列 同步执行了方法1",[NSThread currentThread]);
    };
    
    dispatch_block_t task2=^{
        NSLog(@"%@ 并行队列 同步执行了方法2",[NSThread currentThread]);
    };
    
    dispatch_block_t task3=^{
        NSLog(@"%@ 并行队列 同步执行了方法3",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:1.0];
    };
    
    dispatch_block_t task4=^{
        NSLog(@"%@ 并行队列 同步执行了方法4",[NSThread currentThread]);
    };
    
    dispatch_block_t task5=^{
        NSLog(@"%@ 并行队列 同步执行了方法5",[NSThread currentThread]);
    };
    
    //加入队列
    
    //同步的方式 执行队列
    dispatch_sync(queue, task1);
    
    dispatch_sync(queue, task2);
    
    dispatch_sync(queue, task3);
    
    dispatch_sync(queue, task4);
    
    dispatch_sync(queue, task5);
    
}

//异步的方式 执行并行队列 会创建多个新的线程来执行 多个任务
// 是随机无序执行的
-(void)demo4
{
    //创建串行队列关键字 DISPATCH_QUEUE_SERIAL
    //   并行队列关键字 DISPATCH_QUEUE_CONCURRENT
    dispatch_queue_t queue=dispatch_queue_create("itcast", DISPATCH_QUEUE_CONCURRENT);
    
    //创建任务
    dispatch_block_t task1=^{
        NSLog(@"%@ 并行队列 异步执行了方法1",[NSThread currentThread]);
    };
    
    dispatch_block_t task2=^{
        NSLog(@"%@ 并行队列 异步执行了方法2",[NSThread currentThread]);
    };
    
    dispatch_block_t task3=^{
        NSLog(@"%@ 并行队列 异步执行了方法3",[NSThread currentThread]);
    };
    
    dispatch_block_t task4=^{
        NSLog(@"%@ 并行队列 异步执行了方法4",[NSThread currentThread]);
    };
    
    dispatch_block_t task5=^{
        NSLog(@"%@ 并行队列 异步执行了方法5",[NSThread currentThread]);
    };
    
    //加入队列
    
    //异步的方式 执行队列
    
    //会顺序执行
    dispatch_async(queue, task1);
    
    dispatch_async(queue, task2);
    
    dispatch_async(queue, task3);
    
    dispatch_async(queue, task4);
    
    dispatch_async(queue, task5);
    
    
}

@end
