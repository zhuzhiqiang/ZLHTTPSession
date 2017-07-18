//
//  ViewController.m
//  ZLHTTPSession
//
//  Created by apple on 2017/3/24.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "HttpSession.h"

@interface ViewController () {
    UITextView *_tv;
}

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor grayColor]];
    CGFloat device_width = [UIScreen mainScreen].bounds.size.width;
    CGFloat device_height = [UIScreen mainScreen].bounds.size.height;
    UIButton *btn = [UIButton new];
    [btn setTitle:@"HTTPS" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(20, 50, 200, 60)];
    [btn setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(getData) forControlEvents:UIControlEventTouchUpInside];
    _tv = [UITextView new];
    [_tv setFrame:CGRectMake(0, 0, device_width, device_height)];
    [_tv setBackgroundColor:[UIColor whiteColor]];
    [_tv setFrame:CGRectMake(20, 120, device_width*0.8, device_height*0.6)];
    [self.view addSubview:_tv];
}

- (void)getData {
    NSString *URL = @"https://192.168.40.240:8443/";
//    NSString *url = @"https://www.baidu.com";
    // 获取百度首页html代码
    [HttpSession GETRequestForData:URL parameters:nil maskType:1 comleteBlock:^(id responseObject) {
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        //[_tv setText:result];
        NSLog(@"response:%@",result);
    } errorBlock:nil];
}

@end
