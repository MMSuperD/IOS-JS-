//
//  ViewController.m
//  IOS-JS
//
//  Created by sh-lx on 2019/3/8.
//  Copyright © 2019年 WangDan. All rights reserved.
//

#import "ViewController.h"
#import "WebviewController.h"
#import "WKWebViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
}
- (IBAction)actionBtn:(UIButton *)sender {
    
    WebviewController *vc = [WebviewController new];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)actionWkWebViewBtn:(UIButton *)sender {
    
    WKWebViewController *vc = [WKWebViewController new];
    
    [self.navigationController pushViewController:vc animated:YES];
}


@end
