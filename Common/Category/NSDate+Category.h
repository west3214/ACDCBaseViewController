//
//  NSDate+Category.h
//  JTProject
//
//  Created by 张西方 on 2018/12/28.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Category)

/* 获取当前时间NSDate */
+ (NSDate*)ll_getNowDate;
/* 获取当前时间字符串 */
+(NSString*)ll_getNowDateStringWithDateFormatStr:(NSString *)dateFormatStr;
/* 获取当前时间的时间戳 (秒)-( 如果换算毫秒,再乘以1000),  formatterStr  你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
 */
+(NSInteger)ll_getNowTimeStampWithFormatter:(NSString *)formatterStr;


//时间戳 <--> NSDate
/*  时间戳 转 NSDate.   timeStamp 时间戳字符串(秒)  */
+ (NSDate *)ll_getDateWithTimeStamp:(NSString *)timeStamp WithFormatter:(NSString *)formatterStr;
/* 时间戳 转 NSDate.  timeStamp 时间戳字符串(毫秒) */
+ (NSDate *)ll_getDateWithTimeStamp2:(NSString *)timeStamp WithFormatter:(NSString *)formatterStr;


/*  NSDate 转时间戳 .(秒)  */
+ (long long)ll_getTimeStampWithDate:(NSDate *)date;
/* NSDate 转时间戳 .(毫秒) */
+ (long long)ll_getTimeStampWithDate2:(NSDate *)date;


//时间戳  <--> 时间字符串
/*1 时间戳 转 时间字符串,  timeStamp 时间戳字符串(秒) */
+ (NSString *)ll_getDateStringWithTimeStamp:(NSString *)timeStamp WithFormatter:(NSString *)formatterStr;
/*2 时间戳 转 时间字符串,  timeStamp 时间戳字符串(毫秒) */
+ (NSString *)ll_getDateStringWithTimeStamp2:(NSString *)timeStamp WithFormatter:(NSString *)formatterStr;

//时间字符串 转 时间戳
//秒
+(long long)ll_getDateStampWithDateString:(NSString *)dateString WithFormatter:(NSString *)formatterStr;
//毫秒
+(long long)ll_getDateStampWithDateString2:(NSString *)dateString WithFormatter:(NSString *)formatterStr;



//NSDate <-->时间字符串
/* NSDate转化时间字符串 */
+(NSString *)ll_getDateStringWithDate:(NSDate *)date DateFormatterString:(NSString *)formatterStr;
/* 字符串转化NSDate */
+(NSDate*)ll_getDateFromTimeString:(NSString*)timeString DateFormatterStr:(NSString *)formatterStr;



/* 时间比较大小 < */
-(BOOL)ll_isLaterThanDate:(NSDate *)date;
/* 时间比较大小 ==  */
-(BOOL)ll_isEqualToDate:(NSDate *)date;
/* 时间比较大小 > */
-(BOOL)ll_isEarlierThanDate:(NSDate *)date;




/*时间字符串
 //     和当前时间比较
 //     1）1分钟以内 显示        :    刚刚
 //     2）1小时以内 显示        :    X分钟前
 //     3）今天或者昨天 显示      :    今天 09:30   昨天 09:30
 //     4）当前时间之前或者明天 显示      :    今天 09:30   明天 09:30
 //     5) 今年显示              :   09月12日
 //     6) 大于本年      显示    :    2013/09/09
 //
 //     @param dateString @"2016-04-04 20:21"
 //     @param formate    @"YYYY-MM-dd HH:mm"
 //     hh与HH的区别:分别表示12小时制,24小时制
 **/
+ (NSString *)ll_getCustomDateStringWithDateString:(NSString *)dateString withFormate:(NSString *) formate;


@end
