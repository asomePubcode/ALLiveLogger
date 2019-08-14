//
//  ViewController.m
//  Logger-iphone
//
//  Created by 廖亚雄 on 2019/7/26.
//  Copyright © 2019 廖亚雄. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 200)];
    label.font = [UIFont systemFontOfSize:20];
    label.text = @"1.打开电脑的浏览器输入 http://你手机IP:61234（需要电脑和手机为统一局域网下）2.加载出页面后打开元素检查，进到日志页面";
    label.numberOfLines = 0;
    [self.view addSubview:label];
}

@end
