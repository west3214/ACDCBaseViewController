//
//  NSArray+Category.h
//  JTProject
//
//  Created by 张西方 on 2019/1/14.
//  Copyright © 2019年 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Category)
/**
数组转换成字符串
 */
+(NSString *)ll_convertToJsonStringWithArray:(NSArray *)arr;


/**
 *  转换成JSON串字符串（没有可读性）
 *
 *  @return JSON字符串
 */
- (NSString *)toJSONString;

/**
 *  转换成JSON串字符串（有可读性）
 *
 *  @return JSON字符串
 */
- (NSString *)toReadableJSONString;

/**
 *  转换成JSON数据
 *
 *  @return JSON数据
 */
- (NSData *)toJSONData;
@end
