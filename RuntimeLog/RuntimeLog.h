//
//  RuntimeLog.h
//  RuntimeLog
//
//  Created by guoyf on 2017/10/11.
//  Copyright © 2017年 guoyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuntimeLog : NSObject

+(void)logPropertiesForClass:(Class)targetClass;
+(void)logMethodsForClass:(Class)targetClass;
@end
