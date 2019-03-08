//
//  JSContextDelegate.m
//  IOS-JS
//
//  Created by sh-lx on 2019/3/8.
//  Copyright © 2019年 WangDan. All rights reserved.
//

#import "JSContextDelegate.h"

@implementation JSContextDelegate

static JSContext *_jsContext;

- (void)dealloc
{
    NSLog(@"dfsdsf");
}

+ (void)setJsContext:(JSContext *)jsContext {
    _jsContext = jsContext;
}

+ (JSContext *)jsContext {
    return _jsContext;
}

/**
 JS 调用原生的方法
 */
+ (void)callCamera {
    
    NSLog(@"调用摄像头");
    //这里是得到JS 方法
    JSValue *picCallBack = _jsContext[@"picCallback"];
    //这里是调用JS 方法,给JS 传入参数
    [picCallBack callWithArguments:@[@"I love you"]];
    
}

+ (void)share:(NSString *)shareInfo {
    
    //这里是子线程
    NSLog(@"%@",shareInfo);
    NSLog(@"%@",[NSThread currentThread]);
    JSValue *shareCallBack = _jsContext[@"shareCallback"];
    [shareCallBack callWithArguments:nil];
    
    NSLog(@"%@",[NSThread currentThread]);
}

@end
