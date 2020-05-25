//
//  NSString+Category.h
//  JTProject
//
//  Created by 张西方 on 2018/11/17.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

//AES加密解密
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonDigest.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Category)


/**
 获取字符串宽度
 */
+(CGFloat)ll_getTheActualWidthOfString:(NSString*)str
                              WithFont:(UIFont*)font;
/**
 获取字符串高度
 */
+(CGFloat)ll_getTheActualHeightOfString:(NSString *)string
                               WithFont:(UIFont *)font
                           WithMaxWidth:(CGFloat)maxWidth;
/**
 是否为空
 */
+ (BOOL)ll_isBlankString:(NSString *)str;
/**
 时间戳转时间
 */
+(NSString *)ll_getTheTimeStringWithTimestamp:(NSNumber *)timestamp withFormatter:(NSString *)format;
/**
 时间转时间戳(精确到毫秒)
 */
+(NSString *)ll_getTheTimeIntervalWithTimeString:(NSString *)timeStr withFormatter:(NSString *)format;
/**
 邮箱地址验证
 */
+(BOOL)ll_validateEmail:(NSString *)email;
/**
 身份证号码验证
 */
+(BOOL)ll_validateIDCardNumber:(NSString *)value;

/**
手机号验证
 */
+(BOOL)ll_validatePhoneNumber:(NSString *)value;

/**
 转换成拼音
 */
+(NSString *)ll_transportToPinYin:(NSString *)string;
/**
 Json字符串转字典
 */
+ (NSDictionary *)ll_transportToDictionaryWithJsonString:(NSString *)jsonString;


/**
 MD5加密
 */
+ (NSString *)ll_MD5:(NSString *) str;

/**
 URL字符串智能添加
 */
-(NSString *)ll_SmartStitchingIP;




/**
 AES加密
 PSW_AES_KEY : 这里填写客户端跟后台商量的key
 AES_IV_PARAMETER  : 偏移量
 */
- (NSString*)aci_encryptWithAESWithKey:(NSString *)PSW_AES_KEY
                               WithPYL:(NSString *)AES_IV_PARAMETER;

/**
 AES解密
PSW_AES_KEY : 这里填写客户端跟后台商量的key
AES_IV_PARAMETER  : 偏移量
*/
- (NSString*)aci_decryptWithAESWithKey:(NSString *)PSW_AES_KEY
                               WithPYL:(NSString *)AES_IV_PARAMETER ;



@end

NS_ASSUME_NONNULL_END
