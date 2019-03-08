//
//  WebviewController.m
//  IOS-JS
//
//  Created by sh-lx on 2019/3/8.
//  Copyright © 2019年 WangDan. All rights reserved.
//

#import "WebviewController.h"

@interface WebviewController ()

@property (nonatomic,weak)UIWebView *webView;

@end

@implementation WebviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    // Do any additional setup after loading the view.
}


- (void)setupUI {
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    self.webView = webView;
    
    
}

@end
