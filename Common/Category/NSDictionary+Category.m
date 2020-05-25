//
//  NSDictionary+Category.m
//  JTProject
//
//  Created by 张西方 on 2018/12/25.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "NSDictionary+Category.h"

@implementation NSDictionary (Category)
/**
 字典转换成字符串
 */
+(NSString *)ll_convertToJsonStringWithDictionary:(NSDictionary *)dict

{
   
    NSError *error;
    // 注
    //NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingSortedKeys error:&error];
    if (dict) {
        // NSJSONWritingSortedKeys这个枚举类型只适用iOS11所以我是使用下面写法解决的
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:nil error:&error];
        
        NSString *jsonString;
        if (!jsonData) {
            NSLog(@"%@",error);
        }else{
            jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        
        return jsonString;
    }else{
        return nil;
    }
}
@end
