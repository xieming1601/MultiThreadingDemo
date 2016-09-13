//
//  ViewController.m
//  MultiThreadingDemo
//
//  Created by xsm on 16/9/11.
//  Copyright © 2016年 xsm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize imageView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSThread *current = [NSThread currentThread];
//    NSThread *mainT = [NSThread mainThread];
//    NSLog(@"%@",current);
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:imageView];
    
    // 给imageView添加约束
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        // 添加大小约束
        make.size.mas_equalTo(CGSizeMake(200, 200));
        //添加局中约束
        make.center.mas_equalTo(self.view);
        
    }];
    
    
    // 点击按钮 开始播再点击按钮停止播
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"播放" forState:UIControlStateNormal];
    [button setTitle:@"停止" forState:UIControlStateSelected];
    [button addTarget:self action:@selector(PlayAnimate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        // 添加大小约束
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.left.mas_equalTo(self.imageView.left);
        make.top.mas_equalTo(self.imageView.top).offset(-50);
    }];
    
    // 点击另一个按钮 循环打印
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setTitle:@"打印" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(Print:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        // 添加大小约束
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.right.mas_equalTo(self.imageView.right);
        make.top.mas_equalTo(self.imageView.top).offset(-50);
    }];
    
    // 播放一组图片
    NSMutableArray *imageArray = [NSMutableArray array];
    for (int i = 0; i < 9; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"a100%d.jpg", i + 1]];
        // 加进数组
        [imageArray addObject:image];
    }
    // 设置播放属性
    self.imageView.animationImages = imageArray;
    self.imageView.animationDuration = 2.0;
    self.imageView.animationRepeatCount = 0;
    
    
    //程序启动时建立并启动线程
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(Print:) object:nil];
//    // 开启这个线程
//    [thread start];
    
//    //建立并自动开启线程
//    [NSThread detachNewThreadSelector:@selector(Print:) toTarget:self withObject:nil];
    
    //该方法可以结束线程
//    [thread cancel];
    
    //该方法同样可以在后台开启一个线程
//    [self performSelectorInBackground:@selector(Print:) withObject:nil];
    
    
}

-(void) PlayAnimate:(UIButton *) btn{
    btn.selected = !btn.selected;
    if (btn.selected == YES) {
        
        [self.imageView startAnimating];
        
    } else {
        
        [self.imageView stopAnimating];
    }
}

-(void) Print:(id) sender{
    
    //在不用多线程的情况下卡死主线程
    @autoreleasepool {
        for (int i = 0; i < 888888888; i++) {
            NSLog(@"%d", i);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
