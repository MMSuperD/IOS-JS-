//
//  WebviewController.m
//  IOS-JS
//
//  Created by sh-lx on 2019/3/8.
//  Copyright © 2019年 WangDan. All rights reserved.
//

#import "WebviewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "JSContextDelegate.h"



@interface WebviewController ()<UIWebViewDelegate>

@property (nonatomic,weak)UIWebView *webView;

@property (nonatomic,weak)JSContextDelegate *delegateObject;

@end

@implementation WebviewController

/*
 JavaScriptCore中常见的几种类型
 
 JSContext：代表JS的执行环境，通过evaluateScript:方法就可以执行JS方法。
 JSValue：封装了JS与ObjC中对应的模型，以及调用JS的API等。
 JSExport：一个协议，通过遵守此协议，可以定义我们自己的协议，在协议中声明的API都会在JS中暴露出来，能被JS调用。
 JSManagedValue：管理数据和方法的类。
 JSVirtualMachine：处理线程相关，使用较少。

 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}


- (void)setupUI {
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    self.webView = webView;
    self.webView.delegate = self;
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"jsDemo" withExtension:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    //第一步获取当前的JS 环境
    JSContext *jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    //之所以用[JSContextDelegate Class] 是因为内存泄漏,这样完美的解决内存泄漏
    jsContext[@"Interaction"] = [JSContextDelegate class];
    JSContextDelegate.jsContext = jsContext;

    jsContext.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        context.exception = exception;
        
        NSLog(@"异常信息%@",exception);
        
    };
}




- (void)dealloc
{
    NSLog(@"%@",NSStringFromClass([self class]));

}

@end
