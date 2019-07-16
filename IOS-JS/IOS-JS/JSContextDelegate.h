//
//  JSContextDelegate.h
//  IOS-JS
//
//  Created by sh-lx on 2019/3/8.
//  Copyright © 2019年 WangDan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JSExportInteraction <JSExport>

+ (void)callCamera;

+ (void)share:(NSString *_Nullable)shareInfo;

@end

NS_ASSUME_NONNULL_BEGIN

@interface JSContextDelegate : NSObject<JSExportInteraction>

//这个是添加了类属性,添加类属性,Xcode 不会自动的生成内成员变量,需要我们自己定义,并且实现get 和set 方法
@property (nonatomic,strong,class)JSContext *jsContext;

@end

NS_ASSUME_NONNULL_END
