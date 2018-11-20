//
//  ViewController.m
//  NoDataView
//
//  Created by 李少锋 on 2018/11/20.
//  Copyright © 2018年 李少锋. All rights reserved.
//

#import "ViewController.h"
#import "NoDataView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加无网空白页
    [NoDataView initAddSubView:self.view WithNoDirection:NoNetworkView];
    
    //添加无网空白页，有点击刷新的
    [NoDataView initAddSubView:self.view WithNoDirection:NoNetworkView andBlock:^{
        NSLog(@"刷新");
    }];
}


@end
