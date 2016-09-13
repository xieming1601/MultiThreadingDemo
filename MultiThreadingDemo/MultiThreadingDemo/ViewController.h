//
//  ViewController.h
//  MultiThreadingDemo
//
//  Created by xsm on 16/9/11.
//  Copyright © 2016年 xsm. All rights reserved.
//

#import <UIKit/UIKit.h>

// 只要添加了这个宏，就不用带mas_前缀
#define MAS_SHORTHAND
// 只要添加了这个宏，equalTo就等价于mas_equalTo
#define MAS_SHORTHAND_GLOBALS

// 这个头文件一定要放在上面两个宏的后面
#import "Masonry.h"


@interface ViewController : UIViewController

@property (nonatomic,strong) UIImageView* imageView;

@end

