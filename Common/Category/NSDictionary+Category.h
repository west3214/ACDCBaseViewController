//
//  NSDictionary+Category.h
//  JTProject
//
//  Created by 张西方 on 2018/12/25.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Category)
/**
 字典转换成字符串
 */
+(NSString *)ll_convertToJsonStringWithDictionary:(NSDictionary *)dict;

@end
