//
//  ViewController.m
//  OpenURLInSafari
//
//  Created by Fancy on 16/2/29.
//  Copyright © 2016年 Fancy. All rights reserved.
//

#import "ViewController.h"
#import "SafariActivity.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //创建名为百度一下，你就知道 的Button按钮
    UIButton *showActiviesButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [showActiviesButton setTitle:@"百度一下，你就知道" forState:UIControlStateNormal];
    [showActiviesButton addTarget:self action:@selector(showActivities:) forControlEvents:UIControlEventTouchUpInside];
    CGSize screensize = [UIScreen mainScreen].bounds.size;
    [showActiviesButton setFrame:CGRectMake((screensize.width/2)-60, (screensize.height/2)-60, 150, 60)];
    [self.view addSubview: showActiviesButton];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showActivities:(id)sender
{


    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    SafariActivity *safariActivity =[[SafariActivity alloc] init];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[url] applicationActivities:@[safariActivity]];
    [self presentViewController:activityVC animated:YES completion:nil];

}




//@[url]表示要分享的东西；@［safariActivity］表示定制动作服务的支持

//在本代码中，用户单击 Open in Safari中就可打开指定的URL，它的视线需要使用UIApplication 的openURL方法，它的功能是在指定的URL打开资源。
@end
