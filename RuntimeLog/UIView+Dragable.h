//
//  UIView+Dragable.h
//  为什么要学习 runtime
//
//  Created by qianfeng on 16/1/20.
//  Copyright (c) 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

//uiview分类的方式，所有的继承自UIView 的类都能使用这里的方法

@interface UIView (Dragable)

@property(nonatomic,assign) BOOL dragable;

@end
