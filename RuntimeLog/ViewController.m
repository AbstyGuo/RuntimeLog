//
//  ViewController.m
//  RuntimeLog
//
//  Created by guoyf on 2017/10/11.
//  Copyright © 2017年 guoyf. All rights reserved.
//

#import "ViewController.h"
#import "RuntimeLog.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [RuntimeLog logPropertiesForClass:[UIView class]];
    [RuntimeLog logMethodsForClass:[UIView class]];
}

@end
