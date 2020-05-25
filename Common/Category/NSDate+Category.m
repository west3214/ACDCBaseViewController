//
//  NSDate+Category.m
//  JTProject
//
//  Created by 张西方 on 2018/12/28.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "NSDate+Category.h"

static NSString *defaultFormatterStr = @"YYYY-MM-dd HH:mm:ss";
@implementation NSDate (Category)

/* 获取当前时间NSDate */
+ (NSDate*)ll_getNowDate{
    return [NSDate date];
}
/* 获取当前时间字符串 */
+(NSString*)ll_getNowDateStringWithDateFormatStr:(NSString *)dateFormatStr{
    //实例化一个NSDateFormatter对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    if (dateFormatStr) {
        //设定时间格式,这里可以设置成自己需要的格式 如 @"YYYY-MM-dd HH:mm:ss"
        [formatter setDateFormat:dateFormatStr];
    }else{
        [formatter setDateFormat:defaultFormatterStr];
    }
    NSDate*currentDate = [NSDate ll_getNowDate];
    return [formatter stringFromDate:currentDate];
}
/* 获取当前时间的时间戳 (秒)-( 如果换算毫秒,再乘以1000),  formatterStr  你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
*/
+(NSInteger)ll_getNowTimeStampWithFormatter:(NSString *)formatterStr{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    if (formatterStr) {
        [dateFormatter setDateFormat:formatterStr];
    }else{
        [dateFormatter setDateFormat:defaultFormatterStr];
        }
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [dateFormatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间
//    ll_Log(@"设备当前的时间:%@",[formatter stringFromDate:datenow]);
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[datenow timeIntervalSince1970]] integerValue];
//    ll_Log(@"设备当前的时间戳:%ld",(long)timeSp); //时间戳的值
    return timeSp;
}







//时间戳 <--> NSDate
/*  时间戳 转 NSDate.   timeStamp 时间戳字符串(秒)  */
+ (NSDate *)ll_getDateWithTimeStamp:(NSString *)timeStamp WithFormatter:(NSString *)formatterStr{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStamp longLongValue]];
    return date;
}
/* 时间戳 转 NSDate.  timeStamp 时间戳字符串(毫秒) */
+ (NSDate *)ll_getDateWithTimeStamp2:(NSString *)timeStamp WithFormatter:(NSString *)formatterStr{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStamp longLongValue] / 1000];
        return date;
}

/*  NSDate 转时间戳 .(秒)  */
+ (long long)ll_getTimeStampWithDate:(NSDate *)date{
     NSInteger timeStamp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] longLongValue];
    return timeStamp;
}
/* NSDate 转时间戳 .(毫秒) */
+ (long long)ll_getTimeStampWithDate2:(NSDate *)date{
    NSInteger timeStamp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] longLongValue] * 1000;
    return timeStamp;
}




//时间戳  <--> 时间字符串
/* 时间戳 转 时间字符串,  timeStamp 时间戳字符串(秒) */
+ (NSString *)ll_getDateStringWithTimeStamp:(NSString *)timeStamp WithFormatter:(NSString *)formatterStr{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    if (formatterStr) {
        // （@"YYYY-MM-dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
        [dateFormatter setDateFormat:formatterStr];
    }else{
        [dateFormatter setDateFormat:defaultFormatterStr];
    }
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [dateFormatter setTimeZone:timeZone];
    NSDate *date
    = [NSDate ll_getDateWithTimeStamp:timeStamp WithFormatter:formatterStr];
    return [dateFormatter stringFromDate:date];
}
/* 时间戳 转 时间字符串,  timeStamp 时间戳字符串(毫秒) */
+ (NSString *)ll_getDateStringWithTimeStamp2:(NSString *)timeStamp WithFormatter:(NSString *)formatterStr{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    if (formatterStr) {
        // （@"YYYY-MM-dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
        [dateFormatter setDateFormat:formatterStr];
    }else{
        [dateFormatter setDateFormat:defaultFormatterStr];
    }
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [dateFormatter setTimeZone:timeZone];
    NSDate *date
    = [NSDate ll_getDateWithTimeStamp2:timeStamp WithFormatter:formatterStr];
    return [dateFormatter stringFromDate:date];
}
//时间字符串 转 时间戳
//秒
+(long long)ll_getDateStampWithDateString:(NSString *)dateString WithFormatter:(NSString *)formatterStr{
    NSDate *date = [NSDate ll_getDateFromTimeString:dateString DateFormatterStr:formatterStr];
    return [NSDate ll_getTimeStampWithDate:date];
}
//毫秒
+(long long)ll_getDateStampWithDateString2:(NSString *)dateString WithFormatter:(NSString *)formatterStr{
    NSDate *date = [NSDate ll_getDateFromTimeString:dateString DateFormatterStr:formatterStr];
    return [NSDate ll_getTimeStampWithDate2:date];
}




//NSDate <-->时间字符串
/* NSDate转化时间字符串 */
+(NSString *)ll_getDateStringWithDate:(NSDate *)date DateFormatterString:(NSString *)formatterStr{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:formatterStr];
    //返回时间字符串
    return [dateFormatter stringFromDate:date];
}
/* 字符串转化NSDate */
+(NSDate*)ll_getDateFromTimeString:(NSString*)timeString DateFormatterStr:(NSString *)formatterStr{
    //实例化一个NSDateFormatter对象
      NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     //设定时间格式,这里可以设置成自己需要的格式 如 @"yyyy-MM-dd HH:mm:ss"
    [dateFormatter setDateFormat:formatterStr];
    //返回时间NSDate
    return [dateFormatter dateFromString:timeString];
}


/* 时间比较大小 > */
-(BOOL)ll_isEarlierThanDate:(NSDate *)date{
    if ([[self earlierDate:date] isEqual:self]) {
        return YES;
    }else{
        return NO;
    }
}
/* 时间比较大小 < */
-(BOOL)ll_isLaterThanDate:(NSDate *)date{
    if ([[self laterDate:date] isEqual:self]) {
        return YES;
    }else{
        return NO;
    }
}
/* 时间比较大小 ==  */
-(BOOL)ll_isEqualToDate:(NSDate *)date{
    return [self isEqualToDate:date];
}



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
+ (NSString *)ll_getCustomDateStringWithDateString:(NSString *)dateString withFormate:(NSString *) formate{
    @try {
        
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        if (formate) {
            [dateFormatter setDateFormat:formate];
        }else{
            [dateFormatter setDateFormat:defaultFormatterStr];
        }
        NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
        [dateFormatter setTimeZone:timeZone];
        
        NSDate * nowDate = [NSDate ll_getNowDate];
        
        //  将需要转换的时间转换成 NSDate 对象
        NSDate * needFormatDate = [dateFormatter dateFromString:dateString];
        //  取当前时间和转换时间两个日期对象的时间间隔
        //  这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:  typedef double NSTimeInterval;
        NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];
        // 再然后，把间隔的秒数折算成天数和小时数：
        NSString *dateStr = @"";
        if (time < 0) {
            if (time >= -60*60*24) {
                dateStr = @"明天";
                [dateFormatter setDateFormat:@"YYYY/MM/dd"];
                NSString * need_yMd = [dateFormatter stringFromDate:needFormatDate];
                NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
                
                [dateFormatter setDateFormat:@"HH:mm"];
                if ([need_yMd isEqualToString:now_yMd]) {
                    //在同一天
                    dateStr = [NSString stringWithFormat:@"今天 %@",[dateFormatter stringFromDate:needFormatDate]];
                }else{
                    //明天天
                    dateStr = [NSString stringWithFormat:@"明天 %@",[dateFormatter stringFromDate:needFormatDate]];
                }
            }else{
                [dateFormatter setDateFormat:@"yyyy"];
                NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
                NSString *nowYear = [dateFormatter stringFromDate:nowDate];
                
                if ([yearStr isEqualToString:nowYear]) {
                    ////  在同一年
                    [dateFormatter setDateFormat:@"MM月dd日"];
                    dateStr = [dateFormatter stringFromDate:needFormatDate];
                }else{
                    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
                    dateStr = [dateFormatter stringFromDate:needFormatDate];
                }
            }
        } else if (time<=60) {  //// 1分钟以内的
            dateStr = @"刚刚";
        }else if(time<=60*60){  ////  一个小时以内的
            
            int mins = time/60;
            dateStr = [NSString stringWithFormat:@"%d分钟前",mins];
            
        }else if(time<=60*60* 24 * 2){   //// 在两天内的
            
            [dateFormatter setDateFormat:@"YYYY/MM/dd"];
            NSString * need_yMd = [dateFormatter stringFromDate:needFormatDate];
            NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
            
            [dateFormatter setDateFormat:@"HH:mm"];
            if ([need_yMd isEqualToString:now_yMd]) {
                //// 在同一天
                dateStr = [NSString stringWithFormat:@"今天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }else{
                ////  昨天
                dateStr = [NSString stringWithFormat:@"昨天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }
        }else {
            
            [dateFormatter setDateFormat:@"yyyy"];
            NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
            NSString *nowYear = [dateFormatter stringFromDate:nowDate];
            
            if ([yearStr isEqualToString:nowYear]) {
                ////  在同一年
                [dateFormatter setDateFormat:@"MM月dd日"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }else{
                [dateFormatter setDateFormat:@"yyyy/MM/dd"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }
        }
        return dateStr;
    } @catch (NSException *exception) {
        return @"";
    }
}


@end
