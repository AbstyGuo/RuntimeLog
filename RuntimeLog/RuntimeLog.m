//
//  RuntimeLog.m
//  RuntimeLog
//
//  Created by guoyf on 2017/10/11.
//  Copyright © 2017年 guoyf. All rights reserved.
//

#import "RuntimeLog.h"
#import <objc/runtime.h>

@implementation RuntimeLog

+(void)logPropertiesForClass:(Class)targetClass{
    //获取到成员变量
    unsigned int count = 0;
    Ivar *members = class_copyIvarList(targetClass, &count);
    NSString * string = @"";
    for (int i = 0 ; i < count; i++) {
        Ivar var = members[i];
        const char *memberName = ivar_getName(var);
        const char *memberType = ivar_getTypeEncoding(var);
        string = [string stringByAppendingString:[NSString stringWithFormat:@"%d %s: %s\n",i,memberType,memberName]];
        //     NSLog(@"%s: %s",memberType,memberName);
    }
    
    /*
      //下面方法获取的属性比较多，重复比较多
        objc_property_t * propty = class_copyPropertyList(targetClass, &count);
        NSString * string = @"";
        for (int i = 0 ; i < count; i++) {
            const char * memberName = property_getName(propty[i]);
            const char * memberType = property_getAttributes(propty[i]);
            string = [string stringByAppendingString:[NSString stringWithFormat:@"%d %s: %s\n",i,memberType,memberName]];
        }
     */
    
    NSLog(@"=======properties=======count======: %d",count); //
    NSLog(@"%@",string);
}

+(void)logMethodsForClass:(Class)targetClass{
    NSString * string = @"";
    unsigned int count = 0;
    Method *memberMethods = class_copyMethodList(targetClass, &count);
    for (int i = 0; i < count; i++) {
        SEL name = method_getName(memberMethods[i]);
        NSString *methodName = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
        string = [string stringByAppendingString:[NSString stringWithFormat:@"%d %@\n",i, methodName]];
        //     NSLog(@"member method:%@", methodName);
    }
    
    NSLog(@"========methods==========count======: %d",count);
    NSLog(@"%@",string);
}

@end
