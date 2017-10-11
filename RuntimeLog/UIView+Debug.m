//
//  UIView+Debug.m
//  Runtime
//
//  Created by qianfeng on 16/1/20.
//  Copyright (c) 2016年 qianfeng. All rights reserved.
//

#import "UIView+Debug.h"
#import <objc/runtime.h>

@implementation UIView (Debug)

+(void)load{
    //交换方法
    
    //获取当前类的某个方法的实现
//    class_getInstanceMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>)
    
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method m1 = class_getInstanceMethod(self, @selector(initWithFrame:));
        
        Method m2 = class_getInstanceMethod(self, @selector(rt_initWithFrame:));
        
        [self swillzleMethod:m1 and:m2];
        
        Method m3 = class_getInstanceMethod(self, @selector(layoutSubviews));
        
        Method m4 = class_getInstanceMethod(self, @selector(mb_layoutSubviews));
        
        [self swillzleMethod:m3 and:m4];
    });
}

+(void)swillzleMethod:(Method)m1 and:(Method)m2{
    
    //交换两个方法的实现
    method_exchangeImplementations(m2, m1);
    
    //交换m1和m2之后，在任何地方调用m1，都会跑到m2的方法中
    
}

-(void)mb_layoutSubviews{
    [self mb_layoutSubviews];
}

//实现要交换的方法
-(id)rt_initWithFrame:(CGRect)frame{
    //这里看似递归调用，其实调用的是m1的方法，也就是系统的方法
    [self rt_initWithFrame:frame];
//    [self.layer setBorderColor:[UIColor redColor].CGColor];
//    
//    [self.layer setBorderWidth:1];
//    
//    
//    if ([self isKindOfClass:NSClassFromString(@"UIStatusBarBatteryItemView")]) {
//        self.backgroundColor = [UIColor cyanColor];
//    }
//    
//    NSLog(@"%@",self);
    return self;
}

@end
