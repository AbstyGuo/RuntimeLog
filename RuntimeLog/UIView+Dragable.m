//
//  UIView+Dragable.m
//  为什么要学习 runtime
//
//  Created by qianfeng on 16/1/20.
//  Copyright (c) 2016年 qianfeng. All rights reserved.
//

#import "UIView+Dragable.h"
#import <objc/runtime.h>

static void * Dragable = &Dragable;

@interface UIView ()

@property(nonatomic,strong)UIPanGestureRecognizer * panGesture;
@end

@implementation UIView (Dragable)

//用对象绑定的方式，给分类‘添加’一个成员变量
-(void)setDragable:(BOOL)dragable
{
    /*获得绑定的对象*/  //第一参数对象，第二个参数指针，两个绑定
//    objc_getAssociatedObject(<#id object#>, <#const void *key#>)
    /*设置绑定对象*/ //对象  地址  值  使用类型
//    objc_setAssociatedObject(<#id object#>, <#const void *key#>, <#id value#>, <#objc_AssociationPolicy policy#>)
    
    //将对象绑定到静态变量的地址上
    objc_setAssociatedObject(self, Dragable, @(dragable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (!self.panGesture) {
        self.panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
        [self addGestureRecognizer:self.panGesture];
    }
    if (dragable) {
        //当开启拖动时候，保证用户交互属性为yes
        self.userInteractionEnabled = YES;
    }
    self.panGesture.enabled = dragable;
}

//处理拖动手势
-(void)handlePan:(UIPanGestureRecognizer *)gesture
{
    //获取手势离super的距离
    CGPoint point = [gesture translationInView:[self superview]];
    self.center = CGPointMake(self.center.x+point.x, self.center.y+point.y);
    [gesture setTranslation:CGPointMake(0, 0) inView:[self superview]];
}

-(BOOL)dragable
{
   return [objc_getAssociatedObject(self, Dragable) boolValue];
}

-(void)setPanGesture:(UIPanGestureRecognizer *)panGesture
{
    //这里用 _cmd 或 @select(panGesture) 方法选择器绑定对象，两者相同
    objc_setAssociatedObject(self,"panGesture", panGesture, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPanGestureRecognizer *)panGesture
{
    return objc_getAssociatedObject(self, "panGesture");
}

@end
